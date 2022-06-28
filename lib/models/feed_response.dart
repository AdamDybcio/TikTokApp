import '../models/feed_model.dart';

class FeedResponse {
  final List<FeedModel> feeds;
  final String error;

  FeedResponse(this.feeds, this.error);

  FeedResponse.fromJson(Map<String, dynamic> json)
      : feeds = (json['videos'] as List)
            .map((video) => FeedModel.fromJson(video))
            .toList(),
        error = "";

  FeedResponse.withError(String errorValue)
      : feeds = [],
        error = errorValue;
}
