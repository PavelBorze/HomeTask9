class ArticleItem {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String content;

  ArticleItem({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleItem.fromJson(Map<String, dynamic> json) {
    RegExp regex = RegExp(r'\[\+\d+\schars\]$');
    return ArticleItem(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: extractInnerUrl(json['urlToImage']), //workaround for Washington Post image urls like this https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2DACJR6GTBA5HLGWPF7XOGDO3Y.JPG&w=1440"
      publishedAt: DateTime.parse(json['publishedAt'] ?? DateTime.now().toIso8601String()),
      content: json['content'] != null ? json['content'].replaceAll(regex, '').trim() : '', //remove the [+xxx chars] at the end of the content
    );
  }
  
 static List<ArticleItem> mapJSONStringToList(List<dynamic> jsonList) {
    return jsonList
      .where((r) => r['title'] != '[Removed]')  //ignore the removed articles
      .map((r) {
        var article = ArticleItem.fromJson(r);
        return article;
      })
      .toList();
  }

  static String? extractInnerUrl(String? input) {
    if (input == null) {
      return null;
    }
    final urlPattern = RegExp(r'src=(https?%3A%2F%2F[^&]+|https?://[^&]+)');
    final match = urlPattern.firstMatch(input);

    if (match != null && match.group(1) != null)  {
      String encoded =  match.group(1)!;
      return Uri.decodeComponent(encoded);
    }
    return input; 
}

}

class Source {
  final String? id;
  final String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

}