import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CupertinoTwitterHome.dart';

class CupertinoTwitter extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoTwitter> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    //color: CupertinoColors.white);
  );

  List<Widget> _pages = [
    CupertinoTwitterHome(),

    ///Home画面以外は,　今後作成する
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: _buildTabBar(),
      tabBuilder: (BuildContext context, int index) {
        return new CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              child: _pages[index]
            );
          }
        );   
      },
    );
  }

  CupertinoTabBar _buildTabBar() {
    return CupertinoTabBar(
      //backgroundColor: Colors.white,
      activeColor: Colors.blue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, size: 28.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 27.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none, size: 27.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outline, size: 27.0),
        ),
      ],
    );
  }
}
