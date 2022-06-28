import 'package:equatable/equatable.dart';

class VideoModel extends Equatable {
  final int id;
  final String quality;
  final String link;

  const VideoModel(this.id, this.quality, this.link);

  VideoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        quality = json['quality'] ?? "",
        link = json['link'] ?? "";

  @override
  List<Object?> get props => [id, quality, link];

  static const empty = VideoModel(0, "", "");
}
