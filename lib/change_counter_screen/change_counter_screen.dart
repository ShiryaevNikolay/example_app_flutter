import 'package:example_app_flutter/change_counter_screen/change_counter_screen_bloc.dart';
import 'package:example_app_flutter/change_counter_screen/change_counter_screen_event.dart';
import 'package:example_app_flutter/change_counter_screen/change_counter_screen_state.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCounterScreen extends StatelessWidget {
  ChangeCounterScreenBloc? _bloc; //не final поля в Stateless  - тебе анализатор сам говорит , что это нехорошо. Виджет часто пересоздается, не стоит в нем делать мутабельные ссылки.
  final Counter? counter;

  ChangeCounterScreen({required this.counter});

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ChangeCounterScreenBloc>(context)
      ..state.counter = this.counter; //не-не, так не стоит. Уж если блок - то надо в реактивность и через add. 

    return Scaffold(
      body: changeCounterWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check_rounded),
          onPressed: () { _bloc!.add(SaveCounter()); }),
    );
  }

  //Стоит выносить в виджеты, а не в методы
  Widget changeCounterWidget() {
    return BlocBuilder<ChangeCounterScreenBloc, ChangeCounterScreenState>(
      builder: (context, state) {
        return _renderState(context, state);
      },
    );
  }

  Widget _renderState(BuildContext context, ChangeCounterScreenState state) {
    return state.counter == null
        ? _counterIsNullWidget()
        : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () { _bloc!.add(DecrementCounter()); },
                  icon: Icon(Icons.remove_rounded),
                ),
                Text(
                  state.counter!.count.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  onPressed: () { _bloc!.add(IncrementCounter()); },
                  icon: Icon(Icons.add_rounded),
                ),
              ],
            ),
          );
  }

  Widget _counterIsNullWidget() {
    return Center(
      child: Text("Counter is null"),
    );
  }
}
