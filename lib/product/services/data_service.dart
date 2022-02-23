import 'package:assignment/core/constants/request_types.dart';
import 'package:assignment/product/constants/enum/api.dart';
import 'package:assignment/product/models/comment.dart';
import 'package:assignment/product/models/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:assignment/core/services/api_service_manager.dart';
import 'package:assignment/product/models/album.dart';

class DataService extends ApiServiceManager {
  DataService() : super(baseURL: RestAPI.base.url);

  Future<List<Album>?> fetchAlbums({int start = 0, int end = 20}) async {
    http.Response response = await createRequestAndSend(
      endPoint: RestAPI.albums.name,
      method: RequestType.GET,
    );

    if (response.statusCode == 200) {
      var result = convert.json.decode(convert.utf8.decode(response.bodyBytes));
      List<Album> album =
          List<Album>.from(result.map((item) => Album.fromJson(item)).toList());
      if (start >= album.length) return [];
      return end > album.length
          ? album.sublist(start, album.length)
          : album.sublist(start, end);
    }
  }

  Future<List<Photo>?> fetchPhotos(int albumID) async {
    http.Response response = await createRequestAndSend(
      endPoint: RestAPI.photos.name,
      method: RequestType.GET,
      queryParams: {'albumId': '$albumID'},
    );

    if (response.statusCode == 200) {
      var result = convert.json.decode(convert.utf8.decode(response.bodyBytes));
      List<Photo> album =
          List<Photo>.from(result.map((item) => Photo.fromJson(item)).toList());
      return album;
    }
  }

  /// albumId as postId
  Future<List<Comment>?> fetchComments(int albumID) async {
    http.Response response = await createRequestAndSend(
      endPoint: RestAPI.comments.name,
      method: RequestType.GET,
      queryParams: {'postId': '$albumID'},
    );

    if (response.statusCode == 200) {
      var result = convert.json.decode(convert.utf8.decode(response.bodyBytes));
      List<Comment> album = List<Comment>.from(
          result.map((item) => Comment.fromJson(item)).toList());
      return album;
    }
  }
}
