import 'package:example_app_flutter/domain/counter.dart';

abstract class MainScreenEvent {}

class LoadCounters extends MainScreenEvent {}

class AddCounter extends MainScreenEvent {
  final Counter counter = Counter(0);
}

class OpenScreenChangeCouner extends MainScreenEvent {}

class DeleteCounter extends MainScreenEvent {
  late final Counter _counter;
  Counter get counter => _counter;

  DeleteCounter(Counter counter) {
    this._counter = counter;
  }
}
