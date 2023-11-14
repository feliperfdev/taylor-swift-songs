import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../domain/models/song.dart';
import '../controllers/fetch_song_video/fetch_song_video_notifier.dart';

class SongPage extends StatefulWidget {
  final Song song;
  const SongPage({
    super.key,
    required this.song,
  });

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  final notifier = Modular.get<FetchSongVideoNotifier>();

  @override
  void initState() {
    notifier.fetch(widget.song.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, videos, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (final video in videos) ...{
                    Text('${video.title}'),
                    const SizedBox(height: 10),
                    Image.network(video.thumbnails?.first.url ?? ''),
                  },
                ],
              ),
            );
          }),
    );
  }
}
