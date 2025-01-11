import 'package:flutter/material.dart';
import 'package:home_task/src/constants.dart';
import 'package:home_task/src/news_feature/presentation/news_articles_page.dart';
import 'package:home_task/src/news_feature/presentation/widgets/category_widget.dart';


/*simple implementation, according to documentation: https://newsapi.org/docs/endpoints/top-headlines
the categories list is hardcoded and country switching is not implemented 
because the only supported country is US*/

class NewsCategoriesPage extends StatelessWidget {

  static const routeName = '/news_categories_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewsArticlesPage.routeName, arguments: categories[index]);
            },
            child: CategoryButton(
              name: categories[index],
              position: index + 1,
            ),
          );
        }
      ),
    );
  }
}