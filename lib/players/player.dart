import 'dart:async';

import 'package:flame/components.dart';
import 'package:superharissa/super_harissa.dart';

enum PlayerState { stable, running }

enum PlayerDirection { left, right, none }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<SuperHarissa> {
  Player(position) : super(position: position);

  late final SpriteAnimation stableAnimation;
  late final SpriteAnimation runningAnimation;

  PlayerDirection direction = PlayerDirection.right;
  double moveSpeed = 100;

  Vector2 velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    _loadAnimations();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updatePlayerMouvement(dt);
    super.update(dt);
  }

  void _loadAnimations() {
    stableAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('main-charachters/harissa/stable.png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        stepTime: 0.5,
        textureSize: Vector2.all(64),
      ),
    );
    runningAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('main-charachters/harissa/run.png'),
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.5,
        textureSize: Vector2.all(64),
      ),
    );
    animations = {
      PlayerState.stable: stableAnimation,
      PlayerState.running: runningAnimation,
    };
    current = PlayerState.running;
  }

  void _updatePlayerMouvement(double dt) {
    double posX = 0.0;
    switch (direction) {
      case PlayerDirection.left:
        posX -= moveSpeed;
        break;
      case PlayerDirection.right:
        posX += moveSpeed;
        break;
      case PlayerDirection.none:
        break;
    }
    velocity = Vector2(posX, 0.0);
    position += velocity * dt;
  }
}
