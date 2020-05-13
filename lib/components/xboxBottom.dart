import 'package:flutter/material.dart';
import 'package:gamesapp/screens/xbox.dart';
import 'package:gamesapp/essential/apiSearch.dart';

class XboxBottom extends StatelessWidget {
  APISearch apiSearch = APISearch(platformCode: 49);
  var myGameList;

  void getData() async {
    myGameList = await apiSearch.requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Color(0xff3C7D12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "XBOX",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              child: Text("OKAY!"),
              color: Colors.white,
              onPressed: () async {
                await getData();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Xbox(gameList: myGameList);
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
