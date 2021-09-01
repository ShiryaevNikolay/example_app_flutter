import 'package:example_app_flutter/main_screen/main_screen_event.dart';
import 'package:example_app_flutter/main_screen/main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {

  MainScreenBloc() : super(InitializeState());

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    try {
      yield LoadingState();
      // TODO: запросить данные из БД
    } catch(_) {
      yield ErrorState();
    }
  }
}