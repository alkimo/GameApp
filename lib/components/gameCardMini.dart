import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamesapp/components/loadingAnimation.dart';

class GameCardMini extends StatefulWidget {
  GameCardMini({this.name, this.rating, this.coverURL});

  final String name;
  final double rating;
  final String coverURL;

  @override
  _GameCardMiniState createState() => _GameCardMiniState();
}

class _GameCardMiniState extends State<GameCardMini> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Material(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(2),
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child:
                            Image.network(widget.coverURL, fit: BoxFit.fill) ??
                                LoadingAnimation(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
