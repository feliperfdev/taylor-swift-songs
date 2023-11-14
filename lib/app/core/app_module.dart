import 'package:flutter_modular/flutter_modular.dart';
import 'package:taylor_swift_songs_for_fun/app/modules/albums/albums_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.add(ModuleRoute(
      Modular.initialRoute,
      module: AlbumsModule(),
    ));
    super.routes(r);
  }
}
