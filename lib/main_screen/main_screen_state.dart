import 'package:example_app_flutter/domain/counter.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MainScreenState {}

//Зачем нужен стейт, который никто не обрабатывает?
class InitializeState extends MainScreenState {}

class EmptyDataState extends MainScreenState {
  static const String message = "Добавьте счетчик";
}

class ShowCountersState extends MainScreenState {
  //Здесь не должно быть бокса - иначе у тебя мутабельные данные. А это потенциальные проблемы в будущем.
  final Box<Counter> countersBox;

  ShowCountersState(this.countersBox);

  //Избегай dynamic
  ShowCountersState copy({countersBox}) =>
      ShowCountersState(countersBox ?? this.countersBox); //если вызываешь без параметров при неверно определнном(или определенном по умолчанию) equals могут быть проблемы
}

class LoadingState extends MainScreenState {}

class ErrorState extends MainScreenState {}
