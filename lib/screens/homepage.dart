import 'package:flutter/material.dart';
import 'package:gamesapp/essential/constant.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:gamesapp/components/xboxBottom.dart';
import 'package:gamesapp/components/psBottom.dart';
import 'package:gamesapp/components/nintendoBottom.dart';
import 'package:gamesapp/components/pcBottom.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var timeScroll = Duration(seconds: 15);
  Widget screenBottom = XboxBottom();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Carousel(
              autoplayDuration: Duration(seconds: 1500),
              onImageTap: (int a) {
                print(a);
              },
              onImageChange: (int a, int b) {
                setState(() {
                  if (b == Console.xbox.index) {
                    screenBottom = XboxBottom();
                    timeScroll = Duration(seconds: 2500);
                  } else if (b == Console.playstation.index) {
                    screenBottom = PsBottom();
                    timeScroll = Duration(seconds: 2500);
                  } else if (b == Console.nintendo.index) {
                    screenBottom = NintendoBottom();
                    timeScroll = Duration(seconds: 2500);
                  } else if (b == Console.pc.index) {
                    screenBottom = PcBottom();
                    timeScroll = Duration(seconds: 25);
                  }
                });
                print("b: $b");
              },
              images: [
                NetworkImage('https://i.imgur.com/C1ZaqHb.jpg'),
                NetworkImage(
                    'https://i.pinimg.com/564x/dd/39/c9/dd39c9b27ca41ae074c8ef2ea60faf1c.jpg'),
                NetworkImage(
                    'https://external-preview.redd.it/Y27dxXoJrbiCe7JFx4ahSlYQBJDV523hu_uRFEAzCFc.jpg?auto=webp&s=213b09b83da568252b4119d5c750eedfa75b8170'),
                NetworkImage(
                    'https://pixelz.cc/wp-content/uploads/2018/07/steam-logo-uhd-4k-wallpaper.jpg'),
              ],
            ),
          ),
          Expanded(
            child: screenBottom,
          ),
        ],
      ),
    );
  }
}
