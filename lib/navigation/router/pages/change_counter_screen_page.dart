import 'package:example_app_flutter/change_counter_screen/change_counter_screen.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangeCounterScreenPage extends Page {

  final Counter? counter;

  ChangeCounterScreenPage({
    required this.counter
  }) : super(key: ValueKey(counter));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => ChangeCounterScreen(counter: counter)
    );
  }
}