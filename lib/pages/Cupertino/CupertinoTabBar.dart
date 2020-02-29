import 'package:flutter/cupertino.dart';

import 'DarkModeColor.dart';

class MyCupertinoTabBar extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoTabBar> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoTabScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      tabBar: CupertinoTabBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        items: [
          BottomNavigationBarItem(
            backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Articles'),
          ),
          BottomNavigationBarItem(
            backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views'),
          ),
        ]
      ), 
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
              navigationBar: CupertinoNavigationBar(
                backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
                middle: (i == 0) ? Text('Articles', style: _buildTextStyle()) : Text('Views', style: _buildTextStyle()),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text(
                    'This is tab #$i',
                    style: CupertinoTheme.of(context)
                      .textTheme
                      .actionTextStyle
                      .copyWith(fontSize: 32),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/helloWorld');
                  },
                ),
              ),
            );
          }
        );
      }
    );
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
