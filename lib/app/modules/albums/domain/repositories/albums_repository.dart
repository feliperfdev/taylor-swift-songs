import '../models/album_song.dart';

abstract class AlbumsRepository {
  Future<AlbumSongFetch> fetchAlbumsWithSongs();
}
