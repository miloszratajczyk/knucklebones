import 'dart:math' as math;

import 'package:flutter/foundation.dart';

extension ListExtensions on List {
  int count<T>(T element) => fold<int>(0, (f, e) => e == element ? f + 1 : f);
  int get max => fold<int>(0, (f, e) => math.max(e, f));
  random() => this[math.Random().nextInt(length)];
}

extension BoolExtensions on bool {
  int toInt() => this ? 1 : 0;
  void operator >>(void Function() function) {
    if (this) function();
  }
}

extension StringExtensions on String {
  String operator -() {
    kDebugMode >> () => print(this);
    return this;
  }
}
