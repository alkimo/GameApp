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
          'fields *; where rating >= 70 & platforms = $platformCode & cover != n; limit 5; sort rating desc;',
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
          'fields *; where game.platforms = $platformCode & date > $lastYear; limit 5;',
    );

    gameList = await jsonDecode(response.body);

    gameList = gameList.toSet().toList();
    print('Inside 1:' + gameList.length.toString());

    gameList.forEach((element) {
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
      body: 'fields *; where id = $myIdListInStr; limit 300; sort date desc;',
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
