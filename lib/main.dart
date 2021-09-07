
import 'package:example_app_flutter/presentation/navigation/router/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/bloc/change_counter/change_counter_screen_bloc.dart';
import 'data/bloc/main_screen/main_screen_bloc.dart';
import 'data/counter_service/storage/counter_storage.dart';
import 'domain/counter.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(CounterAdapter());
  await Hive.openBox<Counter>(CounterStorage.COUNTERS_BOX_NAME);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _delegate = ExampleAppRouterDelegate();

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
          BlocProvider<ChangeCounterScreenBloc>(
              create: (context) => ChangeCounterScreenBloc(_delegate))
        ],
        child: Router(
          routerDelegate: _delegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
