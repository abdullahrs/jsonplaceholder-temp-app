part of 'album_cubit.dart';

enum Status { initial, loading, loaded, error }

class AlbumState extends Equatable {
  final List<Album>? albums;
  final Status status;
  final int? page;
  const AlbumState({
    this.albums,
    required this.status,
    this.page
  });

  @override
  List<Object?> get props => [albums, status, page];

  AlbumState copyWith({
    List<Album>? albums,
    Status? status,
    int? page,
  }) {
    return AlbumState(
      albums: albums ?? this.albums,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }
}
