import 'package:example_app_flutter/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/change_counter_screen/change_counter_screen_state.dart';
import 'package:example_app_flutter/navigation/router/router_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreenBloc extends Bloc<ChangeCounterScreenEvent, ChangeCounterScreenState> {

  final ExampleAppRouterDelegate delegate;

  ChangeCounterScreenBloc({ required this.delegate }) : super(ChangeCounterScreenState());
  
  @override
  Stream<ChangeCounterScreenState> mapEventToState(ChangeCounterScreenEvent event) async* {
    if (event is IncrementCounter) {
      state.counter?.count += 1;
    }

    if (event is DecrementCounter) {
      state.counter?.count -= 1;
    }

    if (event is SaveCounter) {
      state.counter?.save();
      delegate.selectedCounter = null;
    }

    yield state;
  }
}