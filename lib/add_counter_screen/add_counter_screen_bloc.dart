import 'package:example_app_flutter/add_counter_screen/add_counter_screen_event.dart';
import 'package:example_app_flutter/add_counter_screen/add_counter_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCounterScreenBloc extends Bloc<AddCounterScreenEvent, AddCounterScreenState> {

  AddCounterScreenBloc() : super(InitializeState());
  
  @override
  Stream<AddCounterScreenState> mapEventToState(AddCounterScreenEvent event) async* {
    try {
      yield LoadingState();
      // TODO: что-то делать
    } catch(_) {
      yield ErrorState();
    }
  }
}