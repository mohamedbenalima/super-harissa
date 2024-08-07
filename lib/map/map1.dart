import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:superharissa/players/player.dart';

class Map1 extends World {
  late TiledComponent map;
  @override
  FutureOr<void> onLoad() async {
    map = await TiledComponent.load('map.tmx', Vector2.all(16));
    add(map);
    add(Player(Vector2(100, 260)));
    return super.onLoad();
  }
}
