import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

import 'DarkModeColor.dart';

class CupertinoSqliteViewer extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoSqliteViewer> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSqliteViewer", style: _buildTextStyle()),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => DatabaseList())),
              child: Text('SqliteViewer', style: _buttonTextStyleNoBackground),
            ),
          ],
        ),
      ),
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

TextStyle  _buttonTextStyleNoBackground = new TextStyle(
  fontWeight: FontWeight.w300,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: CupertinoColors.activeBlue,  //black , darkMode=white
);