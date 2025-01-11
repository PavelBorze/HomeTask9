import 'dart:convert' show json, utf8;
import 'dart:io';
import 'dart:async';
import 'package:home_task/src/constants.dart';
import 'package:either_dart/either.dart';
import 'network_error.dart';
import '../news_feature/domain/article_item.dart'; 

class Api {
  static final HttpClient _httpClient = HttpClient();
   static final String _url = "newsapi.org";
 
  static Future<Either<NetworkError, List<ArticleItem>>> getArticlesForCategory(String category) async {
    
    final uri = Uri.https(_url, '/v2/top-headlines', {
      'category': category,
      'country': 'us',
      'apiKey': apiKey,
    });
    
    final jsonResponse = await _getJson(uri);

    if (jsonResponse['error'] != null) {
      return Left(NetworkError(-1, jsonResponse['error']));
    }
    if (jsonResponse['articles'] == null) {
      return Left(NetworkError(404, 'No articles found'));
    }

    return Right(ArticleItem.mapJSONStringToList(jsonResponse['articles']));
  }
    

  
  static Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      print('response: ${httpResponse.statusCode}');
      if (httpResponse.statusCode != HttpStatus.ok) {
        return {'error': 'Failed to load data: ${httpResponse.statusCode}'};
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      return {'error': e.toString()};
    }
  }
}
