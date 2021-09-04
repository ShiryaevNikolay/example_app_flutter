import 'package:example_app_flutter/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/change_counter_screen/change_counter_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreenBloc extends Bloc<ChangeCounterScreenEvent, ChangeCounterScreenState> {

  ChangeCounterScreenBloc() : super(InitializeState());
  
  @override
  Stream<ChangeCounterScreenState> mapEventToState(ChangeCounterScreenEvent event) async* {
    try {
      yield LoadingState();
      // TODO: что-то делать
    } catch(_) {
      yield ErrorState();
    }
  }
}