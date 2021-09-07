import 'package:equatable/equatable.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MainScreenState extends Equatable {}

class EmptyDataState extends MainScreenState {
  static const String message = "Добавьте счетчик";

  @override
  List<Object?> get props => [this];
}

class ShowCountersState extends MainScreenState {
  late final ValueListenable<Box<Counter>> _boxListenable;
  ValueListenable<Box<Counter>> get boxListenable => _boxListenable;

  ShowCountersState(boxListenable) {
    this._boxListenable = boxListenable;
  }

  @override
  List<Object?> get props => [_boxListenable];
}

class LoadingState extends MainScreenState {
  @override
  List<Object?> get props => [this];
}

class ErrorState extends MainScreenState {
  @override
  List<Object?> get props => [this];
}
