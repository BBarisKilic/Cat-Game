import 'package:cat_game/components/cat.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

/// CatGame class extends from BaseGame class.
class CatGame extends BaseGame {
  Cat _cat;
  ParallaxComponent _parallaxComponent;

  CatGame() {
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
    _cat = Cat();
    _cat.run();
    add(_cat);
  }
}
