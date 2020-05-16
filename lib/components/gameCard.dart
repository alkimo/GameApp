import 'package:flutter/material.dart';
import 'package:gamesapp/essential/constants.dart';
import 'package:gamesapp/essential/apiSearch.dart';

class GameCard extends StatefulWidget {
  GameCard({this.consoleIndex});
  final String consoleIndex;

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  int gameIndex;

  @override
  void initState() {
    super.initState();
    gameIndex = int.parse(widget.consoleIndex);
    print(gameIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white12,
        child: Center(
          child: Text(Console.values[gameIndex].toString()),
        ),
      ),
    );
  }
}
