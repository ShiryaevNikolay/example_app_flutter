import 'package:example_app_flutter/data/bloc/main_screen/main_screen_state.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/widgets/counter_item_widget.dart';
import 'package:example_app_flutter/presentation/widgets/empty_widget.dart';
import 'package:flutter/widgets.dart';

class CountersList extends StatelessWidget {
  final Iterable<Counter> _counters;
  final Function(Counter) _onCounterTap;

  CountersList(this._counters, this._onCounterTap);

  @override
  Widget build(BuildContext context) {
    if (_counters.isEmpty) {
      return EmptyWidget(EmptyDataState.message);
    } else {
      return ListView.builder(
        itemCount: _counters.length,
        itemBuilder: (context, index) {
          Counter counter = _counters.elementAt(index);

          return CounterItem(counter, _onCounterTap);
        });
    }
  }
}
