import 'package:example_app_flutter/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreen extends StatelessWidget {
  ChangeCounterScreenBloc? _bloc;
  final Counter? counter;

  ChangeCounterScreen({required this.counter});

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ChangeCounterScreenBloc>(context);

    return Scaffold(
      body: counter != null
            ? changeCounterWidget(counter!)
            : counterIsNullWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check_rounded),
        onPressed: () {}
      ),
    );
  }

  Widget changeCounterWidget(Counter counter) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove_rounded),
          ),
          Text(
            counter.count.toString(),
            style: TextStyle(
              fontSize: 20
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }

  Widget counterIsNullWidget() {
    return Center(
      child: Text("Counter is null"),
    );
  }
}
