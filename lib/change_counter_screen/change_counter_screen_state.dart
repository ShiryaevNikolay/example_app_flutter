import 'package:example_app_flutter/domain/counter.dart';

class ChangeCounterScreenState {
  Counter? counter;

  @override
  int get hashCode => this.counter.hashCode;

  @override
  bool operator ==(Object other) {
    return this.counter == other;
  }
}
