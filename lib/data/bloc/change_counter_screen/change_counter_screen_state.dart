import 'package:example_app_flutter/domain/counter.dart';

class ChangeCounterScreenState {
  late final Counter? _counter;
  Counter? get counter => _counter;
  int _currentCount = 0;
  int get currentCount => _currentCount;

  ChangeCounterScreenState({required Counter? counter}) {
    this._counter = counter;
    this._currentCount = this._counter?.count ?? 0;
  }

  ChangeCounterScreenState copyWith({int? count}) =>
      ChangeCounterScreenState(counter: this._counter)
        .._currentCount = count ?? this._currentCount;

  @override
  int get hashCode => _currentCount.hashCode;

  @override
  bool operator ==(Object other) {
    return _currentCount == other;
  }
}
