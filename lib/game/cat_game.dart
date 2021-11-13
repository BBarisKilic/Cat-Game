import 'package:flame/components/animation_component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/spritesheet.dart';

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

    _cat.width = 200;
    _cat.height = 200;
    _cat.x = 100;
    _cat.y = 100;

    add(_cat);
  }
}
