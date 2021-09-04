import 'package:example_app_flutter/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/main_screen/main_screen_bloc.dart';
import 'package:example_app_flutter/navigation/router/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final delegate = ExampleAppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MainScreenBloc>(create: (context) => MainScreenBloc()),
          BlocProvider<ChangeCounterScreenBloc>(create: (context) => ChangeCounterScreenBloc())
        ],
        child: Router(
          routerDelegate: delegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}