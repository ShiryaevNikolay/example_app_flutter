import 'package:example_app_flutter/data/repository/counter_repository.dart';
import 'package:example_app_flutter/presentation/navigation/router/router_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_counter_screen_event.dart';
import 'change_counter_screen_state.dart';

class ChangeCounterScreenBloc
    extends Bloc<ChangeCounterScreenEvent, ChangeCounterScreenState> {
  late final ExampleAppRouterDelegate _routerDelegate;
  final CounterRepository _repository = CounterRepository();

  ChangeCounterScreenBloc(ExampleAppRouterDelegate delegate)
      : super(ChangeCounterScreenState(counter: delegate.selectedCounter)) {
    this._routerDelegate = delegate;
  }

  @override
  Stream<ChangeCounterScreenState> mapEventToState(
      ChangeCounterScreenEvent event) async* {

    if (event is InitialCounter) {
      yield ChangeCounterScreenState(counter: _routerDelegate.selectedCounter);
    }

    if (event is IncrementCounter) {
      yield state.copyWith(count: state.currentCount + 1);
    }

    if (event is DecrementCounter) {
      yield state.copyWith(count: state.currentCount - 1);
    }

    if (event is SaveCounter) {
      if (state.counter != null) {
        _repository.updateCounter(state.counter!..count = state.currentCount);
      }
      _routerDelegate.selectedCounter = null;
    }
  }
}
