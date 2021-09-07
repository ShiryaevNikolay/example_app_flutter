import 'package:example_app_flutter/presentation/navigation/router/router_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_counter_screen_event.dart';
import 'change_counter_screen_state.dart';

class ChangeCounterScreenBloc
    extends Bloc<ChangeCounterScreenEvent, ChangeCounterScreenState> {
  late final ExampleAppRouterDelegate _routerDelegate;

  ChangeCounterScreenBloc(ExampleAppRouterDelegate delegate)
      : super(ChangeCounterScreenState(delegate.selectedCounter)) {
    this._routerDelegate = delegate;
  }

  @override
  Stream<ChangeCounterScreenState> mapEventToState(
      ChangeCounterScreenEvent event) async* {
    if (event is IncrementCounter) {
      state.currentCount += 1;
    }

    if (event is DecrementCounter) {
      state.currentCount -= 1;
    }

    if (event is SaveCounter) {
      state.counter
        ?..count = state.currentCount
        ..save();
      _routerDelegate.selectedCounter = null;
    }

    yield state;
  }
}
