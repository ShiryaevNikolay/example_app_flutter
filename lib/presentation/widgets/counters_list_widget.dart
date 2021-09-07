import 'package:example_app_flutter/data/bloc/main_screen/main_screen_state.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/widgets/counter_item_widget.dart';
import 'package:example_app_flutter/presentation/widgets/empty_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CountersList extends StatelessWidget {

  late final ShowCountersState _state;
  late final Function(Counter) _onCounterTap;

  CountersList(ShowCountersState state, Function(Counter) onCounterTap) {
    this._state = state;
    this._onCounterTap = onCounterTap;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _state.boxListenable, 
      builder: (BuildContext context, Box<Counter> box, _) {
        if (box.values.isEmpty) {
          return EmptyWidget(EmptyDataState.message);
        }
        return ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (context, index) {
            Counter? counter = box.getAt(index);

            return counter != null ? CounterItem(counter, _onCounterTap) : Text("Ничего");
          }
        );
      }
    );
  }
}