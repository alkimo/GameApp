import 'package:flutter/material.dart';
import 'package:gamesapp/essential/constants.dart';

class ScreenBottom extends StatelessWidget {
  ScreenBottom({this.consoleIndex});
  final String consoleIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Container(
            height: 50,
            child: FlatButton(
              child: Text(
                consoleIndex,
              ),
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
