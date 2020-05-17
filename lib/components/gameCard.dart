import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamesapp/essential/constants.dart';
import 'package:gamesapp/essential/apiSearch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  String myGameCoverId = '';
  String myGameName = '';
  String myGameRating = '';
  String myGamePopularity = '';
  String myGameSummary = '';

  final spinkit = SpinKitDoubleBounce(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.blueGrey : Colors.blue,
        ),
      );
    },
  );

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

    getData();
  }

  void getData() async {
    apiSearch = APISearch(platformCode: consoleApiCode, coverCode: 0);
    myGameList = await apiSearch.requestData();

    setState(() {
      myGameName = myGameList[0]['name'];
      myGameCoverId = myGameList[0]['cover'].toString();
      myGameRating = myGameList[0]['rating'].toString();
      myGamePopularity = myGameList[0]['popularity'].toString();
      myGameSummary = myGameList[0]['summary'].toString();
    });

    print(myGameList[0]);
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
                          child: myGameCoverId == ''
                              ? spinkit
                              : Text(myGameCoverId),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              myGameName == '' ? spinkit : Text(myGameName),
                              Text(myGameRating),
                              Text(myGamePopularity),
                              Text(myGameSummary),
                            ],
                          ),
                        ),
                      ),
                    ),
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
