import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamesapp/components/circleGenre.dart';
import 'package:gamesapp/components/topSearchBar.dart';
import 'package:gamesapp/components/gameCard.dart';

class ConsoleScreen extends StatefulWidget {
  ConsoleScreen({this.consoleIndexValue});
  final String consoleIndexValue;

  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  String myIndex;

  @override
  void initState() {
    myIndex = widget.consoleIndexValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TopSearchBar(),
        GameCard(consoleIndex: myIndex),
        GameCard(consoleIndex: myIndex),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                    CircleGenre(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
