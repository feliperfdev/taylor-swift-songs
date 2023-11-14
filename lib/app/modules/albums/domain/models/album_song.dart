import 'album.dart';
import 'song.dart';

class AlbumSongFetch {
  late List<List<dynamic>> _albumsAndSongs;

  AlbumSongFetch(List<List<dynamic>> albumsAndSongs) {
    _albumsAndSongs = albumsAndSongs;
  }

  List<Album> get albums => _albumsAndSongs
      .map(
        (list) => list.whereType<Album>().toList(),
      )
      .expand((_) => _)
      .toList();

  List<Song> songsByAlbumId(int? albumId) => _albumsAndSongs
      .map(
        (list) => list
            .where((element) {
              return element is Song && element.albumId == albumId;
            })
            .whereType<Song>()
            .toList(),
      )
      .expand((_) => _)
      .toList();
}
