import 'package:example_app_flutter/data/bloc/main_screen/main_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/main_screen/main_screen_event.dart';
import 'package:example_app_flutter/data/bloc/main_screen/main_screen_state.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {

  MainScreenBloc? _bloc;
  final Function(Counter) onCounterTap;

  MainScreen({required this.onCounterTap});

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<MainScreenBloc>(context);

    return Scaffold(
      body: BlocBuilder<MainScreenBloc, MainScreenState>(builder: (context, state) {
        return _renderState(context, state);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addCounter
      ),
    );
  }

  Widget _renderState(BuildContext context, MainScreenState state) {

    if (state is LoadingState) {
      return _renderLoadingState();
    }

    if (state is ShowCountersState) {
      return _renderCounters(state);
    }

    return _renderInitialState();
  }

  ValueListenableBuilder _renderCounters(ShowCountersState state) {
    return ValueListenableBuilder(
      valueListenable: state.boxListenable, 
      builder: (context, box, _) {
        if (box.values.isEmpty) {
          return _renderEmptyState();
        }
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            Counter counter = box.getAt(index);

            return _buildItemView(counter);
          }
        );
      }
    );
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

  Widget _buildItemView(Counter counter) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: () {
            onCounterTap(counter);
          },
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(counter.count.toString()),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    _bloc?.add(DeleteCounter(counter));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addCounter() {
    _bloc?.add(AddCounter());
  }
}