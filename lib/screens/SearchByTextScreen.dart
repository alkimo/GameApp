import 'package:flutter/material.dart';
import 'package:gamesapp/components/loadingAnimation.dart';
import 'package:gamesapp/essential/apiSearch.dart';
import 'package:gamesapp/components/gameCardMini.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SearchByTextSearchScreen extends StatefulWidget {
  SearchByTextSearchScreen({this.input, this.consoleIndex});

  final String input;
  final int consoleIndex;

  @override
  _SearchByTextSearchScreenState createState() =>
      _SearchByTextSearchScreenState();
}

class _SearchByTextSearchScreenState extends State<SearchByTextSearchScreen> {
  var myRequest;
  List<GameCardMini> gameRecentCardList = [];
  var gameCover;
  var a;
  var b;

  @override
  void initState() {
    APISearch apiSearch = APISearch(
        searchString: widget.input, platformCode: widget.consoleIndex);
    getTextSearchData(apiSearch);
    super.initState();
  }

  void getTextSearchData(var apiRequest) async {
    myRequest = await apiRequest.requestDataByButton();

    myRequest.forEach((game) async {
      gameCover = await apiRequest.getCover(game['cover']);
      print("Gamecover: ");
      print(gameCover);

      if (gameCover.length != 0) {
        a = 'https://' +
            gameCover[0]['url'].substring(2, 36) +
            't_720p' +
            gameCover[0]['url'].substring(43);
      } else {
        a = 'https://geodis.com/br/sites/default/files/styles/max_800x800/public/2018-06/404.png';
      }

      gameCover = a;
      b = GameCardMini(
          name: game['name'], rating: game['rating'], coverURL: gameCover);

      setState(() {
        gameRecentCardList.add(b);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child: CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                height: 50,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: 0.3,
              ),
              items: gameRecentCardList.map((item) => item).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
