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
  int consoleIndexGameCardInput;
  int consoleApiCode;
  String consoleName;
  APISearch apiSearch;

  @override
  void initState() {
    super.initState();

    consoleIndexGameCardInput = int.parse(widget.consoleIndex);
    consoleName = Console.values[consoleIndexGameCardInput].toString();

    if (consoleName == 'Console.playstation') {
      consoleApiCode = ps4ApiCode;
    } else if (consoleName == 'Console.xbox') {
      consoleApiCode = xboxApiCode;
    } else if (consoleName == 'Console.switch') {
      consoleApiCode = switchApiCode;
    } else if (consoleName == 'Console.pc') {
      consoleApiCode = pcApiCode;
    }

    apiSearch = APISearch(platformCode: consoleApiCode, coverCode: 0);
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white12,
        child: Center(
          child: Text("Holder"),
        ),
      ),
    );
  }
}
