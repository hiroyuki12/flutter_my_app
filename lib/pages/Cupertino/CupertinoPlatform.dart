import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'DarkModeColor.dart';

class CuperinoPlatform extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CuperinoPlatform> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CuperinoPlatform", style: _buildFont()),
        //trailing: Text("Edit", style: myTextStyle),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: Text(
          Platform.isIOS ? "iOS!" : "Not iOS!",
          style: _buildFont(),),
      ),
    );
  }
}

var _myTextStyle = new TextStyle();
TextStyle _buildFont() {
  return _myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}