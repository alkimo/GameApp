import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gamesapp/essential/constants.dart';
import 'package:gamesapp/essential/apiKey.dart';

class APISearch {
  var gameList;
  var stringURL;
  int platformCode;
  int coverCode;

  APISearch({this.platformCode, this.coverCode});

  Future<List> requestDataTopRated() async {
    var response = await http.post(
      url,
      headers: {'user-key': kAPIKey, 'Content-Type': 'application/json'},
      body:
          'fields *; where rating >= 70 & platforms = $platformCode & cover != n; limit 30; sort rating desc;',
    );
    gameList = await jsonDecode(response.body);
    return gameList;
  }

  Future<List> requestDataLatest() async {
    var idList = [];
    String myIdListInStr;
    var lastYear = getTime();
    var response = await http.post(
      date,
      headers: {'user-key': kAPIKey, 'Content-Type': 'application/json'},
      body:
          'fields *; where game.platforms = $platformCode & date > $lastYear; limit 100; sort rating desc;',
    );

    gameList = await jsonDecode(response.body);

    gameList.forEach((element) async {
      idList.add(element['game']);
    });

    print(idList.length);
    myIdListInStr = "(" +
        idList.toString().substring(1, idList.toString().length - 1) +
        ")";

    print(myIdListInStr);

    var listResponse = await http.post(
      url,
      headers: {'user-key': kAPIKey, 'Content-Type': 'application/json'},
      body: 'fields *; where id = $myIdListInStr;',
    );

    gameList = await jsonDecode(listResponse.body);
    return gameList;
  }

  Future<dynamic> getCover(var coverCode) async {
    var response = await http.post(
      urlIMG,
      headers: {'user-key': kAPIKey, 'Content-Type': 'application/json'},
      body: 'fields *; where id = $coverCode;',
    );
    stringURL = await jsonDecode(response.body);
    return stringURL;
  }

  String getTime() {
    return '1558137600';
  }
}
