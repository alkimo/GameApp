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
  List gameListByRating;
  List gameListRecent;
  List<GameCard> gameRatingCardList = [];
  List<GameCard> gameRecentCardList = [];

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

    getData();
  }

  void getData() async {
    apiSearch = APISearch(platformCode: consoleApiCode, coverCode: 0);
    gameListByRating = await apiSearch.requestDataTopRated();
    gameListRecent = await apiSearch.requestDataLatest();

    print("Hmm");
    print(gameListByRating.length);
    print(gameListRecent.length);
    print("Hmm");

    addGameRatingDataToList();
    addGameRecentDataToList();
  }

  void addGameRatingDataToList() async {
    gameListByRating.forEach(
      (game) async {
        tempVar = await apiSearch.getCover(game['cover']);

        a = 'https://' +
            tempVar[0]['url'].substring(2, 36) +
            't_720p' +
            tempVar[0]['url'].substring(43);

        b = GameCard(
            name: game['name'] == null ? 'nothing' : game['name'],
            rating: game['rating'] == null ? 'nothing' : game['rating'],
            summary: game['summary'] == null ? 'nothing' : game['summary'],
            coverURL: a);

        setState(() {
          gameRatingCardList.add(b);
        });
      },
    );
  }

  void addGameRecentDataToList() async {
    print("* * * Inside addGameRecentData * * *");
    print(gameListRecent.length);
    gameListRecent.forEach(
      (game) async {
        print(game['name']);
        tempVar = await apiSearch.getCover(game['cover']);

        print(tempVar == null ? tempVar : 'No Covers');

        if (tempVar.length != 0) {
          a = 'https://' +
              tempVar[0]['url'].substring(2, 36) +
              't_720p' +
              tempVar[0]['url'].substring(43);
        } else {
          a = 'https://geodis.com/br/sites/default/files/styles/max_800x800/public/2018-06/404.png';
        }

        b = GameCard(
            name: game['name'] == null ? 'nothing' : game['name'],
            rating:
                game['rating'].toString() == null ? 'nothing' : game['rating'],
            summary: game['summary'] == null ? 'nothing' : game['summary'],
            coverURL: a);

        setState(() {
          gameRecentCardList.add(b);
        });
      },
    );
    print("* * * Outside addGameRecentData * * *");
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
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
            items: gameRatingCardList.map((item) => item).toList(),
          ),
        ),
        Expanded(
          flex: 4,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: double.infinity,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 6),
            ),
            items: gameRecentCardList.map((item) => item).toList(),
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
