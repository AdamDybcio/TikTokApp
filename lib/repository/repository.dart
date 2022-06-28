import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

import '../models/feed_response.dart';

class UserRepository {
  final String apiKey = FlutterConfig.get('API_KEY');
  static String mainUrl = "https://api.pexels.com";
  final Dio _dio = Dio();
  var getFeedsAPI = '$mainUrl/videos/search';

  Future<FeedResponse> getFeeds() async {
    var params = {
      "api_key": apiKey,
      "query": "nba",
      "size": "medium",
      "orientation": "portrait",
    };

    try {
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: ((options, handler) async {
        options.headers['Authorization'] = apiKey;
        _dio.interceptors.requestLock.unlock();
        return handler.next(options);
      })));
      Response response = await _dio.get(getFeedsAPI, queryParameters: params);
      return FeedResponse.fromJson(response.data);
    } catch (error) {
      return FeedResponse.withError("$error");
    }
  }
}
