
import 'package:flutter/widgets.dart';

extension BuildContextExt on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
}

extension StateExt<T extends StatefulWidget> on State<T> {
  updateState() => setState((){ });
}

extension DurationExt on int {
  Duration get  ms => Duration(milliseconds: this);
  Duration get sec => Duration(seconds: this);
}
