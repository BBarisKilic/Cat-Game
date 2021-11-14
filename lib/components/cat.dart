import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/rendering.dart';

class Cat extends AnimationComponent {
  SpriteSheet _catSpriteSheet;
  Animation _runAnimation;
  Animation _hitAnimation;

  Cat() : super.empty() {
    _catSpriteSheet = SpriteSheet(
      imageName: 'cat_sprite_sheet.png',
      textureWidth: 32,
      textureHeight: 32,
      columns: 8,
      rows: 10,
    );

    run();
  }

  @override
  void resize(Size size) {
    height = width = size.width / 10;
    x = width;
    y = size.height - 30 - height;
    super.resize(size);
  }

  void run() {
    _runAnimation =
        _catSpriteSheet.createAnimation(4, from: 0, to: 7, stepTime: 0.1);
    animation = _runAnimation;
  }

  void hit() {
    _hitAnimation =
        _catSpriteSheet.createAnimation(9, from: 0, to: 7, stepTime: 0.1);
    animation = _hitAnimation;
  }
}
