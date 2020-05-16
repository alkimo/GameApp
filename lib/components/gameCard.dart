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
  List myGameList;

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
    getData();
  }

  void getData() async {
    myGameList = await apiSearch.requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Material(
              child: Container(
                color: Colors.black12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text("Image Half"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text("Info Half"),
                        ),
                      ),
                    ),
//                    Center(child: Text(myGameList[0]['name'])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
