import 'package:example_app_flutter/domain/counter.dart';

class ChangeCounterScreenState {
  late Counter? _counter;
  Counter? get counter => _counter;
  int currentCount = 0;

  ChangeCounterScreenState(Counter? counter) {
    this._counter = counter;
    this.currentCount = this._counter?.count ?? 0;
  }

  @override
  int get hashCode => currentCount.hashCode;

  @override
  bool operator ==(Object other) {
    return currentCount == other;
  }
}
