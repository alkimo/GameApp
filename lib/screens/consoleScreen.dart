import 'package:flutter/cupertino.dart';
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
          flex: 2,
          child: SafeArea(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Material(
                        child: Center(
                          child: Container(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search games',
//                                Add Console games here
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.redAccent,
                        child: FlatButton(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.white,
            child: Center(
              child: Text("OK"),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.black54,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/1506/PNG/512/emblemok_103757.png'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
