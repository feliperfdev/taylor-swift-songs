import '../../domain/models/album_song.dart';

abstract class AlbumsDatasource {
  Future<AlbumSongFetch> fetchAlbumsWithSongs();
}
