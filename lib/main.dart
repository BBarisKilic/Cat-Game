import 'package:cat_game/app/view/app.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

void main() async {
  // You need to call this method if you need the
  // binding to be initialized before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();

  // Sets the app to be fullscreen
  // (no buttons bar os notifications on top).
  await Flame.device.fullScreen();

  // Sets the preferred orientation of the app to
  // landscape only.
  await Flame.device.setLandscape();

  // Inflate the given widget and attach it to the screen.
  runApp(const App());
}
