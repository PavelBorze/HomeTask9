
import 'package:home_task/src/network/api.dart';

import '../domain/article_item.dart';
import 'package:either_dart/either.dart';
import '../../network/network_error.dart';

class ArticleListRepository {
  
  const ArticleListRepository();

  Future<Either<NetworkError, List<ArticleItem>>> getArticles(String category) async {
    
    final response = await Api.getArticlesForCategory(category);
    return response;
  }

}