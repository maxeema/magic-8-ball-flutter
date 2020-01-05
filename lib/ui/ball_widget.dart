import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  int magic = 0, trial = 1, score = 0;

  _onTap() {
    if (updating) {
      score += ball.num;
      if (ball.num == 8)
        magic++;
    } else {
      ball.update();
      magicWidget.doMagic();
      trial++;
    }
    updating = !updating;
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildInfo(context, "Magic", magic),
              SizedBox(width: 10,),
              buildInfo(context, "Trial", trial),
              SizedBox(width: 10,),
              buildInfo(context, "Score", score),
            ],
          ),
          Spacer(),
          Expanded(//padding: 80.insets.all,
            flex: 4,
            child: AnimatedCrossFade(
              firstChild: Opacity(opacity: updating ? 0 : 1,
                  child: MagicWidget(child: Image.asset("images/magic_ball${ball.num}.webp"), oneShot: true)
              ),
              secondChild: magicWidget = MagicWidget(child: Image.asset("images/ripple_ball.webp"), oneShot: false,),
              crossFadeState: updating ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: 200.ms,
            ),
          ),
          Spacer(),
          AnimatedOpacity(
            duration: 300.ms,
            opacity: updating ? .75 : .4,
            child: buildAppName(),
          ),
          Spacer(),
        ],
      ),
    );
  }

  RichText buildAppName() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(letterSpacing: 1.3),
        children: <TextSpan>[
          TextSpan(text: "Magic 8 ball",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
          ),
          TextSpan(text: "\n"),
          TextSpan(text: "Tap ball to get lucky",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300)
          ),
        ],
      ),
    );
  }

  buildInfo(BuildContext context, String title, int value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.black.withAlpha(155)),
        ),
        AnimatedCrossFade(
          firstChild: Text(
            value <= 0 ? "0" : "${value % 2 == 0 ? value : value - 1}",
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .subtitle
                .copyWith(color: Colors.black.withAlpha(155),
                fontWeight: FontWeight.bold),
          ),
          secondChild: Text(
            value <= 0 ? "0" : "${value % 2 == 1 ? value : value - 1}",
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .subtitle
                .copyWith(color: Colors.black.withAlpha(155),
                fontWeight: FontWeight.bold),
          ),
          duration: 300.ms,
          crossFadeState: value % 2 == 0
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        )
      ],
    );
  }

}
