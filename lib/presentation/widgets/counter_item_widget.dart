import 'package:example_app_flutter/data/bloc/main_screen/main_screen_bloc.dart';
import 'package:example_app_flutter/data/bloc/main_screen/main_screen_event.dart';
import 'package:example_app_flutter/domain/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterItem extends StatelessWidget {
  final Counter _counter;
  final Function(Counter) _onCounterTap;

  CounterItem(this._counter, this._onCounterTap);

  @override
  Widget build(BuildContext context) {
    MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          onTap: () {
            _onCounterTap(_counter);
          },
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_counter.count.toString()),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    bloc.add(DeleteCounter(_counter));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
