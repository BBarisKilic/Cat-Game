import 'package:cat_game/components/cat.dart';
import 'package:cat_game/components/enemy.dart';
import 'package:cat_game/constants/game_asset.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';

/// CatGame class extends from BaseGame class.
class CatGame extends FlameGame with TapDetector {
  late ParallaxComponent _parallaxComponent;
  late Cat _cat;
  late Enemy _enemy;

  @override
  Future<void> onLoad() async {
    final parallax = await getParallax();

    await images.load(GameAsset.catImage);
    await images.load(GameAsset.hyenaImage);

    _parallaxComponent = ParallaxComponent(
      parallax: parallax,
    );
    _cat = Cat();
    _enemy = Enemy();

    // Adding a new component to the components list.
    add(_parallaxComponent);

    // Adding a new component to the components list.
    add(_cat);

    // Adding a new component to the components list.
    add(_enemy);

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownInfo details) {
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

  /// Getting background images.
  Future<Parallax> getParallax() async {
    final images = <ParallaxImageData>[];

    for (final image in GameAsset.parallaxBackground) {
      images.add(ParallaxImageData(image));
    }

    final parallax = await loadParallax(
      images,
      baseVelocity: Vector2(100, 0),
      velocityMultiplierDelta: Vector2(1, 0),
    );

    return parallax;
  }
}
