import 'dart:developer';

abstract class MainEvent {}

class FabClick extends MainEvent {}

class ItemClick extends MainEvent {
  Counter counter;

  ItemClick({required this.counter});
}

class IncrementCount extends MainEvent {}

class DecrementCount extends MainEvent {}

class Cancel extends MainEvent {}