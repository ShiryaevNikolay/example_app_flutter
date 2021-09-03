import 'package:example_app_flutter/domain/counter.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MainScreenState {}

class InitializeState extends MainScreenState {}

class EmptyDataState extends MainScreenState {
  static const String message = "Добавьте счетчик";
}

class ShowCountersState extends MainScreenState {
  final Box<Counter> countersBox;

  ShowCountersState(this.countersBox);

  ShowCountersState copy({countersBox}) =>
      ShowCountersState(countersBox ?? this.countersBox);
}

class LoadingState extends MainScreenState {}

class ErrorState extends MainScreenState {}
