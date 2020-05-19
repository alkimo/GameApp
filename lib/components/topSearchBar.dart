import 'package:flutter/material.dart';

class TopSearchBar extends StatelessWidget {
  double uniHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 25),
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
                        decoration: InputDecoration(
                          hintText: 'Search games',
//                                Add Console games here
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: uniHeight,
                    child: FlatButton(
                      disabledColor: Colors.redAccent,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.redAccent),
                      ),
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
