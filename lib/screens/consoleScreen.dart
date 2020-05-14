import 'package:flutter/material.dart';

class ConsoleScreen extends StatefulWidget {
  ConsoleScreen({this.consoleIndexValue});
  final String consoleIndexValue;

  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(widget.consoleIndexValue),
    );
  }
}
