import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';

/// CatGame class extends from BaseGame class.
class CatGame extends BaseGame {
  AnimationComponent _cat;
  SpriteSheet _catSpriteSheet;
  ParallaxComponent _parallaxComponent;

  CatGame() {
    _catSpriteSheet = SpriteSheet(
      imageName: 'cat_sprite_sheet.png',
      textureWidth: 32,
      textureHeight: 32,
      columns: 8,
      rows: 10,
    );

    _cat = AnimationComponent.empty();

    final _runAnimation =
        _catSpriteSheet.createAnimation(4, from: 0, to: 7, stepTime: 0.1);
    _cat.animation = _runAnimation;

    _parallaxComponent = ParallaxComponent(
      [
        ParallaxImage('parallax/7.png'),
        ParallaxImage('parallax/6.png'),
        ParallaxImage('parallax/5.png'),
        ParallaxImage('parallax/4.png'),
        ParallaxImage('parallax/3.png'),
        ParallaxImage('parallax/2.png'),
        ParallaxImage('parallax/1.png'),
      ],
      baseSpeed: const Offset(100, 0),
      layerDelta: const Offset(20, 0),
    );

    /// Adding a new component to the components list.
    add(_parallaxComponent);
    add(_cat);
  }

  @override
  void resize(Size size) {
    _cat.height = _cat.width = size.width / 10;
    _cat.x = _cat.width;
    _cat.y = size.height - 30 - _cat.height;
    super.resize(size);
  }
}
