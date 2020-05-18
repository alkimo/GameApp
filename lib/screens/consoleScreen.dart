import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamesapp/components/circleGenre.dart';
import 'package:gamesapp/components/loadingAnimation.dart';
import 'package:gamesapp/components/topSearchBar.dart';
import 'package:gamesapp/components/gameCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gamesapp/essential/apiSearch.dart';
import 'package:gamesapp/essential/constants.dart';

class ConsoleScreen extends StatefulWidget {
  ConsoleScreen({this.consoleIndexValue});
  final String consoleIndexValue;

  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  String myIndex;
  String consoleName;
  int consoleApiCode;
  APISearch apiSearch;
  List gameRequestData;
  List<GameCard> gameCardList = [];
  var a;
  GameCard b;

  var tempVar;

  @override
  void initState() {
    super.initState();

    myIndex = widget.consoleIndexValue;

    consoleName = Console.values[int.parse(myIndex)].toString();

    if (consoleName == 'Console.playstation') {
      consoleApiCode = ps4ApiCode;
    } else if (consoleName == 'Console.xbox') {
      consoleApiCode = xboxApiCode;
    } else if (consoleName == 'Console.switch') {
      consoleApiCode = switchApiCode;
    } else if (consoleName == 'Console.pc') {
      consoleApiCode = pcApiCode;
    }

//    print('$consoleName: ' + consoleApiCode.toString());
    getData();
  }

  void getData() async {
    apiSearch = APISearch(platformCode: consoleApiCode, coverCode: 0);
    gameRequestData = await apiSearch.requestDataTopRated();
    addDataToList();
  }

  void addDataToList() async {
    gameRequestData.forEach(
      (game) async {
        tempVar = await apiSearch.getCover(game['cover']);

        a = 'https://' +
            tempVar[0]['url'].substring(2, 36) +
            't_720p' +
            tempVar[0]['url'].substring(43);

        b = GameCard(
            name: game['name'],
            rating: game['rating'],
            summary: game['summary'],
            coverURL: a);

        setState(() {
          gameCardList.add(b);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TopSearchBar(),
        Expanded(
          flex: 3,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              height: double.infinity,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
            items: gameCardList.map((item) => item).toList(),
          ),
        ),
        Expanded(
          flex: 4,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: double.infinity,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 6),
            ),
            items: gameCardList.map((item) => item).toList(),
          ),
        ),
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
