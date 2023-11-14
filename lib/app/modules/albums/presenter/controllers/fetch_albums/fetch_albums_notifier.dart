import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/domain/usecases/fetch_albums_with_songs.dart';

import 'albums_state.dart';

class FetchAlbumsNotifier extends ValueNotifier<AlbumsState> {
  FetchAlbumsNotifier() : super(AlbumsInitialState());

  Future<void> fetch() async {
    value = AlbumsLoadingState();
    value = (await Modular.get<FetchAlbumsWithSongs>().call()).fold(
      (exception) => AlbumsErrorState('message'),
      AlbumsSuccessState.new,
    );
  }
}
