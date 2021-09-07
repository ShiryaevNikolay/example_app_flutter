import 'package:example_app_flutter/data/counter_service/counter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_screen_event.dart';
import 'main_screen_state.dart';

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

        final countersBox = _repository.getCounterBox();

        yield ShowCountersState(countersBox.listenable());
      } catch (_) {
        yield ErrorState();
      }
    }

    if (event is AddCounter) {
      try {
        _repository.addCounter(event.counter);

        yield state;
      } catch (_) {
        yield ErrorState();
      }
    }

    if (event is DeleteCounter) {
      try {
        _repository.deleteCounter(event.counter);

        yield state;
      } catch(_) {
        yield ErrorState();
      }
    }
  }
}
