import 'package:example_app_flutter/main_screen/main_screen_bloc.dart';
import 'package:example_app_flutter/main_screen/main_screen_event.dart';
import 'package:example_app_flutter/main_screen/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {

  MainScreenBloc? _bloc;

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<MainScreenBloc>(context)..add(LoadCounters());

    return Scaffold(
      body: BlocBuilder<MainScreenBloc, MainScreenState>(builder: (context, state) {
        return _renderState(context, state);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: добавление счетчика
        }
      ),
    );
  }

  Widget _renderState(BuildContext context, MainScreenState state) {
  
    if (state is EmptyDataState) {
      return _renderEmptyState();
    }

    if (state is LoadingState) {
      return _renderLoadingState();
    }

    if (state is ShowCountersState) {
      // TODO: показать список счетчиков
    }

    return _renderInitialState();
  }

  Widget _renderInitialState() {
    return Center(
      child: Text("InitialState"),
    );
  }

  Widget _renderEmptyState() {
    return Center(
      child: Text(EmptyDataState.message),
    );
  }

  Widget _renderLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}