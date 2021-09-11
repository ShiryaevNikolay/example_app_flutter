import 'package:example_app_flutter/data/bloc/main_screen/main_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/main_screen/main_screen_event.dart';
import 'package:example_app_flutter/data/bloc/main_screen/main_screen_state.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/widgets/counters_list_widget.dart';
import 'package:example_app_flutter/presentation/widgets/initial_widget.dart';
import 'package:example_app_flutter/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  late final MainScreenBloc _bloc;
  final Function(Counter) onCounterTap;

  MainScreen({required this.onCounterTap});

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<MainScreenBloc>(context);

    return Scaffold(
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
          builder: (context, state) {
        if (state is LoadingState) {
          return LoadingWidget();
        }

        if (state is ShowCountersState) {
          return CountersList(state, onCounterTap);
        }

        return InitialWidget();
      }),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: addCounter),
    );
  }

  void addCounter() {
    _bloc.add(AddCounter());
  }
}
