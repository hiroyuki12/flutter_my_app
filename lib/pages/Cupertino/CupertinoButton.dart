import 'package:flutter/cupertino.dart';

import 'DarkModeColor.dart';

class MyCupertinoButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoButton> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoButton", style: _buildTextStyle()),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              //color: CupertinoColors.activeBlue,
              //borderRadius: new BorderRadius.circular(30.0),
              onPressed: () {
              },
              child: Text('No color', style: _buttonTextStyleNoBackground),
            ),
            SizedBox(height: 32,),
            CupertinoButton(
              color: CupertinoColors.activeBlue,  //backgroundColor
              borderRadius: new BorderRadius.circular(30.0),
              onPressed: () {
              },
              child: Text('With color', style: _buttonTextStyleWithBagckground),
            ),
            SizedBox(height: 32,),
            CupertinoButton(
              color: CupertinoColors.activeBlue,  //backgroundColor
              borderRadius: new BorderRadius.circular(30.0),
              disabledColor: CupertinoColors.systemGrey,
              onPressed: null,
              child: Text('Disabled', style: _buttonTextStyleWithBagckground),
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

var _buttonTextStyleWithBagckground = new TextStyle(
  //fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white
);

TextStyle  _buttonTextStyleNoBackground = new TextStyle(
  fontWeight: FontWeight.w300,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: CupertinoColors.activeBlue,  //black , darkMode=white
);