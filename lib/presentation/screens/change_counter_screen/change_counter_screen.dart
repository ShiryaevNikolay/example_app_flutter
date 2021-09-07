import 'package:example_app_flutter/data/bloc/change_counter/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/change_counter/change_counter_screen_event.dart';
import 'package:example_app_flutter/data/bloc/change_counter/change_counter_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreen extends StatelessWidget {
  ChangeCounterScreenBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ChangeCounterScreenBloc>(context);

    return Scaffold(
      body: changeCounterWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check_rounded),
          onPressed: () {
            _bloc!.add(SaveCounter());
          }),
    );
  }

  Widget changeCounterWidget() {
    return BlocBuilder<ChangeCounterScreenBloc, ChangeCounterScreenState>(
      builder: (context, state) {
        return _renderState(context, state);
      },
    );
  }

  Widget _renderState(BuildContext context, ChangeCounterScreenState state) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              _bloc!.add(DecrementCounter());
            },
            icon: Icon(Icons.remove_rounded),
          ),
          Text(
            state.currentCount.toString(),
            style: TextStyle(fontSize: 20),
          ),
          IconButton(
            onPressed: () {
              _bloc!.add(IncrementCounter());
            },
            icon: Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
