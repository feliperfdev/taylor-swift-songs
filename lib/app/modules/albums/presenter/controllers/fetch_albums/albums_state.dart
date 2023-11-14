import '../../../domain/models/album_song.dart';

abstract class AlbumsState {}

class AlbumsInitialState extends AlbumsState {}

class AlbumsLoadingState extends AlbumsState {}

class AlbumsSuccessState extends AlbumsState {
  final AlbumSongFetch albumSongs;

  AlbumsSuccessState(this.albumSongs);
}

class AlbumsErrorState extends AlbumsState {
  final String message;

  AlbumsErrorState(this.message);
}
