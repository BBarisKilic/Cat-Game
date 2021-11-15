import 'package:cat_game/components/cat.dart';
import 'package:cat_game/components/enemy.dart';
import 'package:cat_game/constants/game_assets.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';

/// CatGame class extends from BaseGame class.
class CatGame extends BaseGame with TapDetector {
  Cat _cat;
  Enemy _enemy;
  ParallaxComponent _parallaxComponent;

  CatGame() {
    _parallaxComponent = ParallaxComponent(
      [
        ParallaxImage(GameAssets.parallaxBackground[0]),
        ParallaxImage(GameAssets.parallaxBackground[1]),
        ParallaxImage(GameAssets.parallaxBackground[2]),
        ParallaxImage(GameAssets.parallaxBackground[3]),
        ParallaxImage(GameAssets.parallaxBackground[4]),
        ParallaxImage(GameAssets.parallaxBackground[5]),
        ParallaxImage(GameAssets.parallaxBackground[6]),
      ],
      baseSpeed: const Offset(100, 0),
      layerDelta: const Offset(20, 0),
    );

    /// Adding a new component to the components list.
    add(_parallaxComponent);
    _cat = Cat();
    add(_cat);
    _enemy = Enemy();
    add(_enemy);
  }

  @override
  void onTapDown(TapDownDetails details) {
    _cat.jump();
    super.onTapDown(details);
  }

  @override
  void update(double t) {
    if (_cat.distance(_enemy) <= _cat.width) {
      _cat.hit();
    } else {
      _cat.run();
    }
    super.update(t);
  }
}
