import 'package:cat_game/constants/game_assets.dart';
import 'package:cat_game/constants/game_physic.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/rendering.dart';

class Cat extends AnimationComponent {
  SpriteSheet _catSpriteSheet;
  Animation _runAnimation;
  Animation _hitAnimation;
  double _speedY = 0;
  double _maxY = 0;

  Cat() : super.empty() {
    _catSpriteSheet = SpriteSheet(
      imageName: GameAssets.catImage,
      textureWidth: 32,
      textureHeight: 32,
      columns: 8,
      rows: 10,
    );

    _runAnimation =
        _catSpriteSheet.createAnimation(4, from: 0, to: 7, stepTime: 0.1);
    _hitAnimation =
        _catSpriteSheet.createAnimation(9, from: 0, to: 7, stepTime: 0.1);

    run();
  }

  bool _isCatOnGround() {
    return y >= _maxY;
  }

  /// This method is called periodically by the game engine
  /// to request that your component updates itself.
  @override
  void update(double t) {
    _speedY = _speedY + GamePhysic.gravity * t;

    y = y + _speedY * t;

    if (_isCatOnGround()) {
      y = _maxY;
      _speedY = 0;
    }

    super.update(t);
  }

  /// This is a hook called by [BaseGame] to let this component
  /// know that the screen (or flame draw area) has been update.
  @override
  void resize(Size size) {
    height = width = size.width / 10;
    x = width;
    y = size.height - 30 - height;
    _maxY = y;
    super.resize(size);
  }

  void run() {
    if (animation == _runAnimation) return;

    animation = _runAnimation;
  }

  void hit() {
    if (animation == _hitAnimation) return;

    animation = _hitAnimation;
  }

  void jump() {
    if (_isCatOnGround()) {
      _speedY = -500;
    }
  }
}
