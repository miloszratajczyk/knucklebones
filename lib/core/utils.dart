extension OccurrencesCounting on List {
  int count<T>(T element) => fold<int>(0, (f, e) => e == element ? f + 1 : f);
}
