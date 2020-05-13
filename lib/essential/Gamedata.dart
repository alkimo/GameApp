import 'package:gamesapp/essential/apiSearch.dart';

class Gamedata {
  Gamedata({this.cover});

  var cover;
  String newUrl;

  void getCover() async {
    APISearch apiSearch = APISearch();
    newUrl = await apiSearch.getCover(cover);
  }
}
