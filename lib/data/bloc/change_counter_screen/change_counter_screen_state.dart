import 'package:equatable/equatable.dart';
import 'package:example_app_flutter/domain/counter.dart';

class ChangeCounterScreenState extends Equatable {
  final Counter? _counter;
  Counter? get counter => _counter;
  late final int _currentCount;
  int get currentCount => _currentCount;

  ChangeCounterScreenState(this._counter) {
    this._currentCount = this._counter?.count ?? 0;
  }

  ChangeCounterScreenState.copyWithCount(this._counter, this._currentCount);

  @override
  List<Object?> get props =>
      [this._counter.hashCode, this._currentCount.hashCode];
}
