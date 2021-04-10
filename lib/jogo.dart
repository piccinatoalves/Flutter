  import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'components/Bullet.dart';
import 'components/Dragon.dart';
import 'components/Spaceship.dart';

var placar = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll(['spaceship.png', 'dragon.png', 'bullet.png']);
  var game = MyGame();
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text("jogo"),
    ),
    body: Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/images/apple.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GameWrapper(game),
    ),
  )));
}

class GameWrapper extends StatelessWidget {
  final MyGame game;
  GameWrapper(this.game);
  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}

class MyGame extends BaseGame with TapDetector {
  var spaceship = new Spaceship();
  var creationTimer = 0.0;
  List<Dragon> dragonList;

  MyGame() {
    dragonList = <Dragon>[];
    add(spaceship);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    creationTimer += t;
    if (creationTimer >= 0.5) {
      creationTimer = 0.0;
      var dragon = new Dragon();
      dragonList.add(dragon);
      add(dragon);
    }

    print('Placar: $placar');
    super.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    spaceship.direction = details.globalPosition.dx;
    addBullet(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Player tap up on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void addBullet(Offset position) {
    Bullet bullet = new Bullet(position, dragonList);
    add(bullet);
  }
}
