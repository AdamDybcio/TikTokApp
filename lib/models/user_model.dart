import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String url;

  const UserModel(this.id, this.name, this.url);

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? "",
        url = json['url'] ?? "";

  @override
  List<Object?> get props => [id, name, url];

  static const empty = UserModel(0, "", "");
}
