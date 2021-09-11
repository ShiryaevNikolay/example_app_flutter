import 'package:example_app_flutter/data/bloc/main_screen/main_screen_state.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/widgets/counter_item_widget.dart';
import 'package:flutter/widgets.dart';

class CountersList extends StatelessWidget {
  final ShowCountersState _state;
  final Function(Counter) _onCounterTap;

  CountersList(this._state, this._onCounterTap);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _state.counters.length,
        itemBuilder: (context, index) {
          Counter counter = _state.counters.elementAt(index);

          return CounterItem(counter, _onCounterTap);
        });
  }
}
