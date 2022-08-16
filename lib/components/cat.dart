import 'package:cat_game/constants/game_asset.dart';
import 'package:cat_game/constants/game_physic.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class Cat extends SpriteAnimationComponent {
  Cat() : super() {
    _catSpriteSheet = SpriteSheet(
      image: Flame.images.fromCache(GameAsset.catImage),
      srcSize: Vector2(32, 32),
    );

    _runAnimation =
        _catSpriteSheet.createAnimation(row: 4, to: 7, stepTime: 0.1);
    _hitAnimation =
        _catSpriteSheet.createAnimation(row: 9, to: 7, stepTime: 0.1);

    run();
  }

  late SpriteSheet _catSpriteSheet;
  late SpriteAnimation _runAnimation;
  late SpriteAnimation _hitAnimation;
  double _speedY = 0;
  double _maxY = 0;

  bool get _isCatOnTheGround => y >= _maxY;

  // This method is called periodically by the game engine
  // to request that your component updates itself.
  @override
  void update(double dt) {
    _speedY = _speedY + GamePhysic.gravity * dt;

    y = y + _speedY * dt;

    if (_isCatOnTheGround) {
      y = _maxY;
      _speedY = 0;
    }

    super.update(dt);
  }

  // This is a hook called by FlameGame to let this component
  // know that the screen (or flame draw area) has been update.
  @override
  void onGameResize(Vector2 size) {
    height = width = size.x / 10;
    x = width;
    y = size.y - 30 - height;
    _maxY = y;
    super.onGameResize(size);
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
    if (!_isCatOnTheGround) return;

    _speedY = -500;
  }
}
