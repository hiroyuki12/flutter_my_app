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
    isDarkMode = false;  // switch darkMode

    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSwitch", style: _buildTextStyle()),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
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

var _myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return _myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
