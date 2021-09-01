import 'package:example_app_flutter/add_counter_screen/add_counter_screen_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCounterScreen extends StatelessWidget {

  AddCounterScreenBloc? _bloc;

  @override
  Widget build(BuildContext context) {

    _bloc = BlocProvider.of<AddCounterScreenBloc>(context);

    return Container(
      child: Text("AddCounter"),
    );
  }
}