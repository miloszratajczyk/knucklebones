import 'dart:math' as math;

extension ListExtensions on List {
  int count<T>(T element) => fold<int>(0, (f, e) => e == element ? f + 1 : f);
  int get max => fold<int>(0, (f, e) => math.max(e, f));
  random() => this[math.Random().nextInt(length)];
}

extension BoolToInt on bool {
  int toInt() => this ? 1 : 0;
}
