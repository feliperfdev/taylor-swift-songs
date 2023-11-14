import 'dart:convert';

class Song {
  final int songId;
  final String title;
  final int albumId;

  Song({
    required this.songId,
    required this.title,
    required this.albumId,
  });

  factory Song.fromJson(dynamic json) {
    var decodedJson = {};

    try {
      decodedJson = jsonDecode(json);
    } catch (e) {
      decodedJson = json;
    }

    return Song(
      songId: decodedJson['song_id'],
      title: decodedJson['title'],
      albumId: decodedJson['album_id'],
    );
  }
}
