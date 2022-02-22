import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable(createToJson: false)
class Album {
  int? userId;
  int? id;
  String? title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
