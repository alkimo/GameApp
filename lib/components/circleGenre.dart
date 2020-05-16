import 'package:flutter/material.dart';

class CircleGenre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: CircleAvatar(
        maxRadius: 25,
        child: Icon(
          Icons.videogame_asset,
        ),
      ),
    );
  }
}
