import 'package:assignment/product/models/album.dart';
import 'package:assignment/product/services/data_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'album_states.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(const AlbumState(status: Status.initial)) {
    getAlbums();
  }

  final DataService _dataService = DataService();

  Future<void> getAlbums() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      var result = await _dataService.fetchAlbums(start: 0, end: 20);
      emit(state.copyWith(albums: result, status: Status.loaded, page: 1));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> loadMore(int startIndex, int endIndex) async {
    var result =
        await _dataService.fetchAlbums(start: startIndex, end: endIndex);
    if (result!.isEmpty) return;
    state.albums!.addAll(result);
    emit(state.copyWith(
        albums: state.albums!, status: Status.loaded, page: state.page! + 1));
  }
}
