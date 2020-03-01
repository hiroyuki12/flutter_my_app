import 'package:flutter/cupertino.dart';
import 'DarkModeColor.dart';

class MyCupertinoActivityIndicator extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoActivityIndicator> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoActivityIndicator", style: _buildTextStyle()),
      ),
      child: Center(
        child: CupertinoActivityIndicator(),
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

var titleTextStyle = new TextStyle(
fontWeight: FontWeight.w100,
decoration: TextDecoration.none,
fontSize: 16,
color: CupertinoColors.white);
