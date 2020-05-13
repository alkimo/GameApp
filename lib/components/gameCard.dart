import 'package:flutter/material.dart';
import 'package:gamesapp/essential/apiSearch.dart';

class GameCard extends StatefulWidget {
  GameCard({this.gameData});
  final gameData;
  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  APISearch apiSearch = APISearch();
  var myCoverId;
  var myCoverURL;

  void getCoverID() async {
    myCoverId = await apiSearch.getCover(widget.gameData['cover']);
    setState(() {
      try {
        myCoverURL = myCoverId[0]['url'];
        var textLenght = myCoverURL.length;

        myCoverURL = myCoverURL.substring(2, textLenght);
      } catch (e) {
        myCoverURL = widget.gameData['cover'];
        print(e);
      }
    });
  }

  void caller() async {
    await getCoverID();
    print(myCoverId);
  }

  void initState() {
    super.initState();
    caller();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(2),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                widget.gameData['name'],
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Text(
                "${widget.gameData['rating'].round()}/100",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Text(
                "$myCoverURL",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              Image.network('https://' + myCoverURL),
            ],
          ),
        ],
      ),
    );
  }
}
