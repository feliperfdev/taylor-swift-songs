import 'dart:convert';

class Album {
  final int albumId;
  final String title;
  final DateTime releaseDate;

  Album({
    required this.albumId,
    required this.title,
    required this.releaseDate,
  });

  factory Album.fromJson(dynamic json) {
    var decodedJson = {};

    try {
      decodedJson = jsonDecode(json);
    } catch (e) {
      decodedJson = json;
    }

    return Album(
      albumId: decodedJson['album_id'],
      title: decodedJson['title'],
      releaseDate: DateTime.parse(decodedJson['release_date']),
    );
  }
}
