import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/models/song.dart';

class AlbumSongsPage extends StatelessWidget {
  final List<Song> songs;
  const AlbumSongsPage({
    super.key,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            onTap: () async {
              await Modular.to.pushNamed(
                '/songPage/',
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
