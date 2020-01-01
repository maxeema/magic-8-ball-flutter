import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_8_ball/ball.dart';

import 'misc/extensions.dart';
import 'misc/insets.dart';

class BallWidget extends StatefulWidget {
  @override
  _BallWidgetState createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> {

  final ball = Ball()..update();

  bool updating = false;

  @override
  Widget build(BuildContext context) =>
    InkWell(onTap: _update,
      child: Padding(padding: 20.insets.all,
        child: Opacity(opacity: updating ? 0 : 1,
          child: Image.asset("images/ball${ball.num}.webp")
        ),
      ),
    );

  _update() {
    updating = true;
    ball.update();
    updateState();
    Future.delayed(250.ms, () {
      updating = false;
      updateState();
    });
  }

}
