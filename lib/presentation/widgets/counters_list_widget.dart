import 'package:example_app_flutter/domain/counter.dart';
import 'package:example_app_flutter/presentation/widgets/counter_item_widget.dart';
import 'package:flutter/widgets.dart';

class CountersList extends StatelessWidget {
  final Iterable<Counter> _counters;
  final Function(Counter) _onCounterTap;

  CountersList(this._counters, this._onCounterTap);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _counters.length,
        itemBuilder: (context, index) {
          Counter counter = _counters.elementAt(index);

          return CounterItem(counter, _onCounterTap);
        });
  }
}
