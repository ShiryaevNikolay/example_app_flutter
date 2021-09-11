import 'package:flutter/widgets.dart';

class EmptyWidget extends StatelessWidget {
  late final String _message;

  EmptyWidget(String message) {
    this._message = message;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_message),
    );
  }
}
