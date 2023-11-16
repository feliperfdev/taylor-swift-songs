import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/utils/app_routes.dart';
import 'package:taylor_swift_songs_for_fun/app/utils/widgets/back_button_appbar_widget.dart';

import '../../domain/models/params/album_songs_params.dart';

class AlbumSongsPage extends StatelessWidget {
  final AlbumSongsParams params;
  const AlbumSongsPage({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(params.albumName),
        leading: const BackButtonAppBarWidget(),
      ),
      body: ListView.builder(
        itemCount: params.songs.length,
        itemBuilder: (context, index) {
          final song = params.songs[index];
          return ListTile(
            onTap: () async {
              await Modular.to.pushNamed(
                AppRoutes.songPage,
                arguments: song,
              );
            },
            title: Text('${song.songId} — ${song.title}'),
          );
        },
      ),
    );
  }
}
