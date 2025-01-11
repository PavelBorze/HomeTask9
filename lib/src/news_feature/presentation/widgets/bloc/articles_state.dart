import 'package:equatable/equatable.dart';
import 'package:home_task/src/news_feature/domain/article_item.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesError extends ArticlesState {
  final String message;

  const ArticlesError(this.message);

  @override
  List<Object> get props => [message];
}

class ArticlesOk extends ArticlesState {
  final List<ArticleItem> articles;

  const ArticlesOk(this.articles);

  @override
  List<Object> get props => [articles];
}

