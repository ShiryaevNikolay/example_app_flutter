import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/presentation/widgets/change_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChangeCounterScreenBloc bloc =
        BlocProvider.of<ChangeCounterScreenBloc>(context);

    return Scaffold(
      body: ChangeCounter(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check_rounded),
          onPressed: () {
            bloc.add(SaveCounter());
          }),
    );
  }
}
