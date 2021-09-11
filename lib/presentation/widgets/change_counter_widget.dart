import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/data/bloc/change_counter_screen/change_counter_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChangeCounterScreenBloc bloc = BlocProvider.of<ChangeCounterScreenBloc>(context);

    return BlocBuilder<ChangeCounterScreenBloc, ChangeCounterScreenState>(
      builder: (context, state) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  bloc.add(DecrementCounter());
                },
                icon: Icon(Icons.remove_rounded),
              ),
              Text(
                state.currentCount.toString(),
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  bloc.add(IncrementCounter());
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
