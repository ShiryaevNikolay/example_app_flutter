import 'package:example_app_flutter/counter_service/counter_repository.dart';
import 'package:example_app_flutter/main_screen/main_screen_event.dart';
import 'package:example_app_flutter/main_screen/main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final CounterRepository _repository = CounterRepository();

  MainScreenBloc() : super(InitializeState()) {
    add(LoadCounters());
  }

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    if (event is LoadCounters) {
      try {
        yield LoadingState();

        final countersBox = await _repository.getBoxCounters();

        yield ShowCountersState(countersBox);
      } catch (_) {
        yield ErrorState();
      }
    }

    if (event is AddCounter) {
      try {
        _repository.addCounter(event.counter);

        //максимально странный участок кода
        if (state is ShowCountersState) {
          yield (state as ShowCountersState).copy();
        } else {
          yield state;
        }
      } catch (_) {
        yield ErrorState();
      }
    }
  }
}
