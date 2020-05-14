import 'package:flutter/material.dart';
import 'package:gamesapp/essential/constants.dart';
import 'package:gamesapp/screens/consoleScreen.dart';

class ScreenBottom extends StatelessWidget {
  ScreenBottom({this.consoleIndex});
  String consoleIndex;

  String consoleIndexValue() {
    return consoleIndex ?? '0';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("ok"),
        Container(
          color: Colors.red,
          height: 50,
          child: FlatButton(
            child: Text(
              consoleIndexValue(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ConsoleScreen(consoleIndexValue: consoleIndexValue());
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
