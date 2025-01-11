import 'package:flutter/material.dart';
import 'package:home_task/src/news_feature/domain/article_item.dart';
import 'package:cached_network_image/cached_network_image.dart';




class ArticleWidget extends StatelessWidget {
  final ArticleItem article;
  
  ArticleWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Center(
                child: CachedNetworkImage(
                        imageUrl: article.urlToImage!,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/fallback_image.webp'),
                      ),
              ),
            SizedBox(height: 10.0),
            Text(
              article.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'By ${article.author ?? 'Unknown'}',
              style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              article.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Published at: ${article.publishedAt.toLocal().toString().substring(0, 16)}',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              article.content,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
