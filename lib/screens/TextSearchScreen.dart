import 'package:flutter/material.dart';

class TextSearchScreen extends StatelessWidget {
  TextSearchScreen({this.input});
  final String input;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(input));
  }
}
