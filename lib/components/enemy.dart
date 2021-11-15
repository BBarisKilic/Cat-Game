import 'package:cat_game/constants/game_assets.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/rendering.dart';

class Enemy extends AnimationComponent {
  SpriteSheet _catSpriteSheet;
  Animation _runAnimation;
  int _speed;
  Size _size;

  Enemy() : super.empty() {
    _catSpriteSheet = SpriteSheet(
      imageName: GameAssets.hyenaImage,
      textureWidth: 48,
      textureHeight: 48,
      columns: 6,
      rows: 1,
    );

    _runAnimation =
        _catSpriteSheet.createAnimation(0, from: 0, to: 5, stepTime: 0.1);
    _speed = 200;
    run();
  }

  /// This method is called periodically by the game engine
  /// to request that your component updates itself.
  @override
  void update(double t) {
    x -= _speed * t;

    if (x < -width) {
      x = _size.width + width;
    }
    super.update(t);
  }

  /// This is a hook called by [BaseGame] to let this component
  /// know that the screen (or flame draw area) has been update.
  @override
  void resize(Size size) {
    height = width = size.width / 10;
    x = size.width + width;
    y = size.height - 30 - height;
    _size = size;
    super.resize(size);
  }

  void run() {
    animation = _runAnimation;
  }
}
