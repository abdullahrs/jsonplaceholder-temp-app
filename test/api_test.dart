import 'package:assignment/product/models/album.dart';
import 'package:assignment/product/models/comment.dart';
import 'package:assignment/product/models/photo.dart';
import 'package:assignment/product/services/data_service.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  DataService dataService = DataService();
  group('[GET]', () {
    test('fetch albums', () async {
      var result = await dataService.fetchAlbums();

      expect(result.runtimeType, List<Album>);
    });

    test('fetch photos', () async {
      var result = await dataService.fetchPhotos(1);

      expect(result.runtimeType, List<Photo>);
    });

    test('fetch comments', () async {
      var result = await dataService.fetchComments(1);

      expect(result.runtimeType, List<Comment>);
    });
  });
}
