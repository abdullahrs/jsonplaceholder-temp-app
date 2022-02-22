import 'package:assignment/product/models/album.dart';
import 'package:assignment/product/services/data_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'album_states.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(const AlbumState(status: Status.initial));

  final DataService _dataService = DataService();

  Future<void> getAlbums() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      var result = await _dataService.fetchAlbums();
      emit(state.copyWith(albums: result, status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
