import 'package:taylor_swift_songs_for_fun/app/modules/albums/domain/models/album_song.dart';

import '../../domain/repositories/albums_repository.dart';
import '../datasources/albums_datasource.dart';

class AlbumsRepositoryImpl implements AlbumsRepository {
  final AlbumsDatasource datasource;

  AlbumsRepositoryImpl(this.datasource);

  @override
  Future<AlbumSongFetch> fetchAlbumsWithSongs() async {
    return datasource.fetchAlbumsWithSongs();
  }
}
