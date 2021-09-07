import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/navigation/router/pages/pages.dart';
import 'package:example_app_flutter/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreenPage extends Page {

  final Function(Counter) onCounterTap;

  MainScreenPage({
    required this.onCounterTap
  }) : super(key: ValueKey(Pages.MAIN_SCREEN_PAGE));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => MainScreen(onCounterTap: onCounterTap)
    );
  }
}