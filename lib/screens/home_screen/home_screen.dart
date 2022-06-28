import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tiktok_app/elements/error_element.dart';
import 'package:tiktok_app/elements/loader_element.dart';
import 'package:tiktok_app/models/feed_model.dart';
import 'package:tiktok_app/models/feed_response.dart';
import 'package:tiktok_app/widgets/video_widget.dart';

import '/bloc/feed_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    feedBloc.getFeeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FeedResponse>(
        stream: feedBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.error != '' && snapshot.data!.error.isNotEmpty) {
              return buildErrorWidget(snapshot.data!.error);
            }
            return _buildFeedWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return buildErrorWidget("error");
          } else {
            return buildLoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildFeedWidget(FeedResponse data) {
    List<FeedModel> feeds = data.feeds;
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: feeds.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              VideoWidget(url: feeds[index].videos[0].link),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.15),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0, 0.6, 1],
                  ),
                ),
              ),
              Positioned(
                  left: 12,
                  bottom: 32,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.white),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(feeds[index].image))),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              feeds[index].user.name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          feeds[index].user.url,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                right: 12,
                bottom: 50,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Ionicons.heart_outline,
                          color: Colors.white,
                          size: 35,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Ionicons.chatbubble_outline,
                          color: Colors.white,
                          size: 30,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Ionicons.paper_plane_outline,
                          color: Colors.white,
                          size: 30,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
