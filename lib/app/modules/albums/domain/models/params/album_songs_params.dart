import '../song.dart';

class AlbumSongsParams {
  final List<Song> songs;
  final String albumName;

  AlbumSongsParams({
    required this.songs,
    required this.albumName,
  });
}
