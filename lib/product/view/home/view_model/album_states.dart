part of 'album_cubit.dart';

enum Status {initial, loading, loaded, error}

class AlbumState extends Equatable {
  final List<Album>? albums;
  final Status status;
  const AlbumState({this.albums,required this.status}); 


  @override
  List<Object?> get props => [albums, status];


  AlbumState copyWith({
    List<Album>? albums,
    Status? status,
  }) {
    return AlbumState(
      albums: albums ?? this.albums,
      status: status ?? this.status,
    );
  }
}
