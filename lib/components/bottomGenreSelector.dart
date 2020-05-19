import 'package:flutter/material.dart';
import 'package:gamesapp/components/circleGenre.dart';

class BottomGenreSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
