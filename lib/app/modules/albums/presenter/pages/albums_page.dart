import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/presenter/controllers/fetch_albums/fetch_albums_notifier.dart';

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
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (_, state, child) {
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
                      '/albumSongsPage/',
                      arguments: songs,
                    );
                  },
                  title: Text(album.title),
                  subtitle: Text('${songs.length} músicas'),
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
