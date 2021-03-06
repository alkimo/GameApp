import 'package:flutter/material.dart';
import 'package:gamesapp/screens/SearchByTextScreen.dart';

class TopSearchBar extends StatelessWidget {
  TopSearchBar({this.consoleIndex});

  var consoleIndex;
  double uniHeight = 40;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Material(
                    child: Container(
                      height: uniHeight,
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search games',
//                                Add Console games here
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: uniHeight,
                    child: FlatButton(
                      color: Colors.redAccent,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchByTextSearchScreen(
                                input: myController.text,
                                consoleIndex: consoleIndex),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
