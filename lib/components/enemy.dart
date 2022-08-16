import 'package:cat_game/constants/game_asset.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteAnimationComponent {
  Enemy() : super() {
    _catSpriteSheet = SpriteSheet(
      image: Flame.images.fromCache(GameAsset.hyenaImage),
      srcSize: Vector2(48, 48),
    );

    _runAnimation =
        _catSpriteSheet.createAnimation(row: 0, to: 5, stepTime: 0.1);

    _speed = 200;
    run();
  }

  late SpriteSheet _catSpriteSheet;
  late SpriteAnimation _runAnimation;
  late int _speed;
  late Vector2 _size;

  // This method is called periodically by the game engine
  // to request that your component updates itself.
  @override
  void update(double dt) {
    x -= _speed * dt;

    if (x < -width) {
      x = _size.x + width;
    }
    super.update(dt);
  }

  // This is a hook called by FlameGame to let this component
  // know that the screen (or flame draw area) has been update.
  @override
  void onGameResize(Vector2 size) {
    height = width = size.x / 10;
    x = size.x + width;
    y = size.y - 30 - height;
    _size = size;
    super.onGameResize(size);
  }

  void run() {
    animation = _runAnimation;
  }
}
