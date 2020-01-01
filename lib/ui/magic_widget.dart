import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../misc/extensions.dart';

final _magicTime = 200.ms;

class MagicWidget extends HookWidget {

  MagicWidget({Key key, @required this.child, @required this.oneShot})
      : assert(child != null), assert(oneShot != null), super(key: key);

  final Widget child;
  final bool oneShot;

  AnimationController _rotation;

  void doMagic([bool doIt = true]) {
    if (_rotation == null) return;
    if (doIt)
      if (oneShot)
        _rotation..reset()..animateTo(1);
      else
        _rotation.repeat(min: 0, max: 1, period: _magicTime);
    else {
      _rotation.stop(canceled: false);
      _rotation.reset();
    }
  }
  bool get isDoingMagic => _rotation?.isAnimating ?? false;

  @override
  Widget build(BuildContext context) {
    _rotation = useAnimationController(lowerBound: 0, upperBound: 1)
      ..duration = _magicTime;
    doMagic();
    return RotationTransition(
      turns: _rotation,
      child: child,
    );
  }
}