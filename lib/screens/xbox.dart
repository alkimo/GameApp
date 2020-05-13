import 'package:flutter/material.dart';
import 'package:gamesapp/components/gameCard.dart';
import 'package:gamesapp/essential/Gamedata.dart';

class Xbox extends StatefulWidget {
  Xbox({this.gameList});
  final gameList;
  List<Gamedata> gameListData = [];

  @override
  _XboxState createState() => _XboxState();
}

class _XboxState extends State<Xbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 150.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Voltar'),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500.0,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 2.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GameCard(gameData: widget.gameList[index]);
                    },
                    childCount: widget.gameList.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
