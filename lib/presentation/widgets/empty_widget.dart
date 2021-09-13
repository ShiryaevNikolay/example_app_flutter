import 'package:flutter/widgets.dart';

class EmptyWidget extends StatelessWidget {
  final String _message;

  EmptyWidget(this._message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_message),
    );
  }
}
