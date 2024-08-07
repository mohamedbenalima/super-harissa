import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:superharissa/map/map1.dart';

class SuperHarissa extends FlameGame {
  late final CameraComponent cam;
  @override
  final world = Map1();
  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
      width: 640,
      height: 360,
      world: world,
    );
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);
    return super.onLoad();
  }
}
