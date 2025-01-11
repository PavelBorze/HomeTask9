import 'package:flutter/material.dart';
import 'article_widget.dart';
import '../../domain/article_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesListWidget extends StatelessWidget {
  final List<ArticleItem> articles;

  ArticlesListWidget({required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
        onTap: () async {
          final url = Uri.parse(articles[index].url);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
            );
          }
        },
        child: ArticleWidget(article: articles[index]),
      );
      },
    );
  }
}