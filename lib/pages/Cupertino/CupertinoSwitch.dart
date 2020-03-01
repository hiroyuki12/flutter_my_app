import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DarkModeColor.dart';

class MyCupertinoSwitch extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

bool _lights = false;

class _State extends State<MyCupertinoSwitch> {

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode

    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoSwitch", style: _buildTextStyle()),
      ),
      child: Row(
        children: [
          Text('Lights', style: _buildTextStyle(),),
          CupertinoSwitch(
            value: _lights,
            onChanged: (bool value) { setState(() { _lights = value; }); },
          ),
        ],
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
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
