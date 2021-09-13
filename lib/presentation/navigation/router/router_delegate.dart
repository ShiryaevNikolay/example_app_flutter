import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/navigation/pages/change_counter_screen_page.dart';
import 'package:example_app_flutter/presentation/navigation/pages/main_screen_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleAppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  ExampleAppRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  Counter? _selectedCounter;
  Counter? get selectedCounter => _selectedCounter;
  set selectedCounter(Counter? value) {
    _selectedCounter = value;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    ChangeCounterScreenBloc _changeCounterScreenBloc =
        BlocProvider.of<ChangeCounterScreenBloc>(context);

    return Navigator(
      key: navigatorKey,
      pages: [
        MainScreenPage(onCounterTap: (Counter counter) {
          selectedCounter = counter;
          _changeCounterScreenBloc.add(InitialCounter());
        }),
        if (selectedCounter != null) ChangeCounterScreenPage()
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        selectedCounter = null;
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {/* Ничего не делаем */}
}
