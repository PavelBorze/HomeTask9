import 'package:flutter/material.dart';
import 'package:home_task/src/news_feature/presentation/widgets/articles_list_widget.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_task/src/news_feature/presentation/widgets/bloc/articles_bloc.dart';
import 'package:home_task/src/news_feature/presentation/widgets/bloc/articles_state.dart';
import 'package:home_task/src/news_feature/data/article_list_repository.dart';

class NewsArticlesPage extends StatelessWidget {

  final String category;

  const NewsArticlesPage({required this.category});

  static const routeName = '/news_articles_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text(category),
      ),
      body: RepositoryProvider(create: (context) => ArticleListRepository(),
      child: BlocProvider(
        create: (context) => ArticlesBloc(RepositoryProvider.of<ArticleListRepository>(context))..add(FetchArticles(category: category)),
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            if (state is ArticlesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ArticlesError) {
              return Center(child: Text(state.message));
            } else if (state is ArticlesOk) {
              return ArticlesListWidget(articles: state.articles);
            }
            return Center(child: Text('Please select a category')); //should not happen
          },
        ),
      ),
      )
    );
  }
}
 
