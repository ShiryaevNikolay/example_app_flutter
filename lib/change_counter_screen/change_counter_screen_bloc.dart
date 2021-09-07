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
      state.counter?.count += 1; //Вот эти операции должны проходит через репозиторий. Иначе выходит, что у тебя репозиторий вроде как отвечает за сохранение в бокс, и сам по себе объект тоже можем менять.
      // в принципе лучше сделать данные иммутабельныи и менять их через копирование.
      // Это же относится и к строкам ниже.
    }

    if (event is DecrementCounter) {
      state.counter?.count -= 1;
    }

    if (event is SaveCounter) {
      state.counter?.save();
      delegate.selectedCounter = null;
    }

    yield state; //так как ты не будешь менять один и тот же стейт - здесь будет копирование.
  }
}