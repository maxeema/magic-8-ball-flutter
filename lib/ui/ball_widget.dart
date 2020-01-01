import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ball.dart';
import '../misc/extensions.dart';
import '../misc/insets.dart';
import 'magic_widget.dart';

class BallWidget extends StatefulWidget {

  @override
  _BallWidgetState createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> {

  final ball = Ball()..update(allowEdge: false);

  bool updating = true;
  var magicWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _onTap,
      child: Padding(padding: 50.insets.all,
        child: AnimatedCrossFade(
          firstChild: Opacity(opacity: updating ? 0 : 1,
              child: MagicWidget(child: Image.asset("images/magic_ball${ball.num}.webp"), oneShot: true)
          ),
          secondChild: magicWidget = MagicWidget(child: Image.asset("images/ripple_ball.webp"), oneShot: false,),
          crossFadeState: updating ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: 200.ms,
        )
      ),
    );
  }

  _onTap() {
    if (!updating) {
      ball.update();
      magicWidget.doMagic();
    }
    updating = !updating;
    updateState();
  }

}
