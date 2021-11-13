import 'package:cat_game/game/cat_game.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async {
  /// You need to call this method if you need the
  /// binding to be initialized before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets the app to be fullscreen
  /// (no buttons bar os notifications on top).
  await Flame.util.fullScreen();

  /// Sets the preferred orientation of the app to
  /// landscape only.
  await Flame.util.setLandscape();

  /// Inflate the given widget and attach it to the screen.
  runApp(Game());
}

class Game extends StatelessWidget {
  Game({Key key}) : super(key: key);

  final BaseGame game = CatGame();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: game.widget,
      ),
    );
  }
}
