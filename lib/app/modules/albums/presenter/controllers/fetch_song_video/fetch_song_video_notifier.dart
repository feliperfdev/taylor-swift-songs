import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:youtube_scrape_api/models/video.dart';
import 'package:youtube_scrape_api/youtube_scrape_api.dart';

class FetchSongVideoNotifier extends ValueNotifier<List<Video>> {
  FetchSongVideoNotifier() : super([]);

  Future<void> fetch(String title) async {
    final ytb = Modular.get<YoutubeDataApi>();

    final videos = await ytb.fetchSearchVideo('Taylor Swift $title');
    value = videos;
  }
}
