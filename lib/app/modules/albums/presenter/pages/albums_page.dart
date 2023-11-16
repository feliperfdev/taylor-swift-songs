import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/presenter/controllers/fetch_albums/fetch_albums_notifier.dart';
import 'package:taylor_swift_songs_for_fun/app/utils/app_routes.dart';

import '../../domain/models/params/album_songs_params.dart';
import '../controllers/fetch_albums/albums_state.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final notifier = Modular.get<FetchAlbumsNotifier>();

  @override
  void initState() {
    notifier.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Albums and Songs',
          style: TextStyle(
            fontSize: 16.5,
          ),
        ),
        leading: IconButton(
          tooltip: 'Search for an album or song',
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Info',
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (_, state, child) {
          if (state is AlbumsErrorState) {
            return Center(
              child: Column(
                children: [
                  const Text('An unexpected error has ocurried!'),
                  const SizedBox(height: 20),
                  Text(state.message),
                ],
              ),
            );
          }

          if (state is AlbumsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AlbumsSuccessState) {
            return ListView.builder(
              itemCount: state.albumSongs.albums.length,
              itemBuilder: (context, index) {
                final album = state.albumSongs.albums[index];
                final songs = state.albumSongs.songsByAlbumId(album.albumId);
                return ListTile(
                  onTap: () async {
                    await Modular.to.pushNamed(
                      AppRoutes.albumSongsPage,
                      arguments: AlbumSongsParams(
                        songs: songs,
                        albumName: album.title,
                      ),
                    );
                  },
                  title: Text(album.title),
                  subtitle: Text('${songs.length} songs'),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
