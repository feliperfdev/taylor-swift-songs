import 'package:dartz/dartz.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/domain/repositories/albums_repository.dart';

import '../models/album_song.dart';

abstract class FetchAlbumsWithSongs {
  Future<Either<Exception, AlbumSongFetch>> call();
}

class FetchAlbumsWithSongsImpl implements FetchAlbumsWithSongs {
  final AlbumsRepository repository;

  FetchAlbumsWithSongsImpl(this.repository);

  @override
  Future<Either<Exception, AlbumSongFetch>> call() async {
    try {
      return Right(await repository.fetchAlbumsWithSongs());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
