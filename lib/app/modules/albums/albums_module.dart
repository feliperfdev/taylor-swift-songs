import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/domain/repositories/albums_repository.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/domain/usecases/fetch_albums_with_songs.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/infra/datasources/albums_datasource.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/presenter/pages/album_songs_page.dart';
import 'package:uno/uno.dart';
import 'package:youtube_scrape_api/youtube_scrape_api.dart';

import 'external/datasources/albums_datasource_impl.dart';
import 'infra/repositories/albums_repository_impl.dart';
import 'presenter/controllers/fetch_albums/fetch_albums_notifier.dart';
import 'presenter/controllers/fetch_song_video/fetch_song_video_notifier.dart';
import 'presenter/pages/albums_page.dart';
import 'presenter/pages/song_page.dart';

class AlbumsModule extends Module {
  @override
  void binds(Injector i) {
    i.add(Uno.new);
    i.add(FetchAlbumsNotifier.new);
    i.add<AlbumsDatasource>(AlbumsDatasourceImpl.new);
    i.add<AlbumsRepository>(AlbumsRepositoryImpl.new);
    i.add<FetchAlbumsWithSongs>(FetchAlbumsWithSongsImpl.new);
    i.add<FetchSongVideoNotifier>(FetchSongVideoNotifier.new);
    i.add<YoutubeDataApi>(YoutubeDataApi.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (_) => const AlbumsPage(),
      ),
    );
    r.add(
      ChildRoute(
        '/albumSongsPage/',
        child: (_) => AlbumSongsPage(
          params: r.args.data,
        ),
      ),
    );
    r.add(
      ChildRoute(
        '/songPage/',
        child: (_) => SongPage(
          song: r.args.data,
        ),
      ),
    );
    super.routes(r);
  }
}
