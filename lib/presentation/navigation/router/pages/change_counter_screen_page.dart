import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/navigation/router/pages/pages.dart';
import 'package:example_app_flutter/presentation/screens/change_counter_screen/change_counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangeCounterScreenPage extends Page {

  ChangeCounterScreenPage() : super(key: ValueKey(Pages.CHANGE_COUNTER_PAGE));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => ChangeCounterScreen()
    );
  }
}