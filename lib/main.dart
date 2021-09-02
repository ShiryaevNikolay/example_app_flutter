import 'dart:io';

import 'package:example_app_flutter/add_counter_screen/add_counter_screen_bloc.dart';
import 'package:example_app_flutter/main_screen/main_screen.dart';
import 'package:example_app_flutter/main_screen/main_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {

  Directory directory = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          BlocProvider<AddCounterScreenBloc>(create: (context) => AddCounterScreenBloc())
        ],
        child: MainScreen(),
      ),
    );
  }
}