import 'package:flutter/material.dart';

class ConsoleScreen extends StatefulWidget {
  ConsoleScreen({this.consoleIndexValue});
  final String consoleIndexValue;

  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  @override
  void initState() {
    print(widget.consoleIndexValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.black12,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: NetworkImage(
                        'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text("OK"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text("OK"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text("OK"),
            ),
          ),
        ),
      ],
    );
  }
}
