import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/utils/widgets/back_button_appbar_widget.dart';
import 'package:taylor_swift_songs_for_fun/app/utils/widgets/shimmering/video_card_shimmering_widget.dart';
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
      appBar: AppBar(
        title: Text(widget.song.title),
        leading: const BackButtonAppBarWidget(),
      ),
      body: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, videos, _) {
            if (videos.isEmpty) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  children: List.generate(
                    10,
                    (_) => const VideoCardShimmeringWidget(),
                  ),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: videos.map(
                  (video) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${video.title}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Image.network(
                              video.thumbnails?.first.url ?? '',
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                return (loadingProgress != null)
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : child;
                              },
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          }),
    );
  }
}
