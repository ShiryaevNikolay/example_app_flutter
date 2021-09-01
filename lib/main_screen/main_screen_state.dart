abstract class MainScreenState {}

class InitializeState extends MainScreenState {}

class EmptyDataState extends MainScreenState {
  static const String message = "Добавьте счетчик";
}

class ShowCountersState extends MainScreenState {}

class LoadingState extends MainScreenState {}

class ErrorState extends MainScreenState {}