import 'dart:io';

import 'package:taylor_swift_songs_for_fun/app/modules/albums/domain/models/album_song.dart';
import 'package:uno/uno.dart';

import '../../domain/models/album.dart';
import '../../domain/models/song.dart';
import '../../infra/datasources/albums_datasource.dart';

class AlbumsDatasourceImpl implements AlbumsDatasource {
  final Uno client;

  AlbumsDatasourceImpl(this.client);

  Future<List<Album>> _fetchAlbums() async {
    final response =
        await client.get('https://taylor-swift-api.sarbo.workers.dev/albums');

    switch (response.status) {
      case HttpStatus.accepted:
        break;
      default:
    }

    return (response.data as List).map((e) => Album.fromJson(e)).toList();
  }

  Future<List<Song>> _fetchSongs() async {
    final response =
        await client.get('https://taylor-swift-api.sarbo.workers.dev/songs');

    switch (response.status) {
      case HttpStatus.accepted:
        break;
      default:
    }

    return (response.data as List).map((e) => Song.fromJson(e)).toList();
  }

  @override
  Future<AlbumSongFetch> fetchAlbumsWithSongs() async {
    final responses = await Future.wait(
      [
        _fetchSongs(),
        _fetchAlbums(),
      ],
    );

    return AlbumSongFetch(responses);
  }
}
