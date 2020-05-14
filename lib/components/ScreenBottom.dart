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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 50,
                  child: FlatButton(
                    child: Text(
                      "Search Games",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ConsoleScreen(
                              consoleIndexValue: consoleIndexValue());
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  height: 50,
                  child: FlatButton(
                    child: Text(
                      "Last IGN News",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
