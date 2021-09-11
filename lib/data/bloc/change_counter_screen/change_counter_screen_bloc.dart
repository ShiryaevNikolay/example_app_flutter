import 'package:example_app_flutter/data/repository/counter_repository.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/navigation/router/router_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_counter_screen_event.dart';
import 'change_counter_screen_state.dart';

class ChangeCounterScreenBloc
    extends Bloc<ChangeCounterScreenEvent, ChangeCounterScreenState> {
  final ExampleAppRouterDelegate _routerDelegate;
  final CounterRepository _repository;

  ChangeCounterScreenBloc(this._repository, this._routerDelegate)
      : super(ChangeCounterScreenState(
            _routerDelegate.selectedCounter ?? Counter(0)));

  @override
  Stream<ChangeCounterScreenState> mapEventToState(
      ChangeCounterScreenEvent event) async* {
    if (event is InitialCounter) {
      yield ChangeCounterScreenState(
          _routerDelegate.selectedCounter ?? Counter(0));
    }

    if (event is IncrementCounter) {
      yield ChangeCounterScreenState.copyWithCount(
          state.counter, state.currentCount + 1);
    }

    if (event is DecrementCounter) {
      yield ChangeCounterScreenState.copyWithCount(
          state.counter, state.currentCount - 1);
    }

    if (event is SaveCounter) {
      if (state.counter != null) {
        _repository.updateCounter(state.counter!..count = state.currentCount);
      }
      _routerDelegate.selectedCounter = null;
    }
  }
}
