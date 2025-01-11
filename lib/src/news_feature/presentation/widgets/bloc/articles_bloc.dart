import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_task/src/news_feature/presentation/widgets/bloc/articles_state.dart';
import 'package:home_task/src/news_feature/data/article_list_repository.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticleListRepository repository;

  ArticlesBloc(this.repository) : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetchArticles);
  }

  Future<void> _onFetchArticles(FetchArticles event, Emitter<ArticlesState> emit) async {
    emit(ArticlesLoading());
    final response = await repository.getArticles(event.category);
    response.fold(
      (error) => emit(ArticlesError(error.message)),
      (articles) => emit(ArticlesOk(articles)),
    );
  }
}

abstract class ArticlesEvent {}


class FetchArticles extends ArticlesEvent {

  final String category;

  FetchArticles({required this.category});

  String get getCategory => category;

  }