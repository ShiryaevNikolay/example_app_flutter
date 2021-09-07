import 'package:example_app_flutter/data/bloc/change_counter/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/change_counter/change_counter_screen_event.dart';
import 'package:example_app_flutter/data/bloc/change_counter/change_counter_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounter extends StatelessWidget {
  late final ChangeCounterScreenBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ChangeCounterScreenBloc>(context);

    return BlocBuilder<ChangeCounterScreenBloc, ChangeCounterScreenState>(
      builder: (context, state) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _bloc.add(DecrementCounter());
                },
                icon: Icon(Icons.remove_rounded),
              ),
              Text(
                state.currentCount.toString(),
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  _bloc.add(IncrementCounter());
                },
                icon: Icon(Icons.add_rounded),
              ),
            ],
          ),
        );
      },
    );
  }
}
