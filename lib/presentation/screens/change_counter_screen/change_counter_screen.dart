import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/presentation/widgets/change_counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreen extends StatelessWidget {
  late final ChangeCounterScreenBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ChangeCounterScreenBloc>(context)..add(InitialCounter());

    return Scaffold(
      body: ChangeCounter(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check_rounded),
          onPressed: () {
            _bloc.add(SaveCounter());
          }),
    );
  }
}
