import 'misc/randomize.dart' as rand;

const _BALL_EDGE = 8;

class Ball {
  int _num;

  int get num => _num ?? 1;

  update({bool allowEdge = true}) {
    _num = rand.randomize(_BALL_EDGE, shift: 1, uniqTo: _num, allowEdge: allowEdge);
  }
}
