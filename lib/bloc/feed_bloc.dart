import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../models/feed_response.dart';
import '../repository/repository.dart';

class FeedBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<FeedResponse> _subject =
      BehaviorSubject<FeedResponse>();

  getFeeds() async {
    FeedResponse response = await _repository.getFeeds();
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = FeedResponse([], "");
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<FeedResponse> get subject => _subject;
}

final feedBloc = FeedBloc();
