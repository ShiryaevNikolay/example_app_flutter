import 'package:equatable/equatable.dart';
import 'package:example_app_flutter/domain/counter.dart';

abstract class MainScreenState {}

class EmptyDataState extends MainScreenState {
  static const String message = "Добавьте счетчик";
}

class ShowCountersState extends MainScreenState with EquatableMixin {
  final Iterable<Counter> _counters;
  Iterable<Counter> get counters => _counters;

  ShowCountersState(this._counters);

  @override
  List<Object?> get props => [this._counters.hashCode];
}

class LoadingState extends MainScreenState {}

class ErrorState extends MainScreenState {}
