import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamesapp/components/loadingAnimation.dart';

class GameCard extends StatefulWidget {
  GameCard({this.name, this.rating, this.summary, this.coverURL});

  final String name;
  final double rating;
  final String summary;
  final String coverURL;

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
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
                color: Colors.black87,
                child: Card(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child:
                            Image.network(widget.coverURL, fit: BoxFit.fill) ??
                                LoadingAnimation(),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(widget.name),
                                  Text(widget.rating.toString()),
                                  Text(widget.summary),
                                ],
                              )
                            ],
                          ),
                        ),
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
