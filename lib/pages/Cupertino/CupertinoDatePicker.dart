import 'package:flutter/cupertino.dart';

import 'DarkModeColor.dart';

class MyCupertinoDatePicker extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoDatePicker> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = false;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoDatePicker", style: _buildTextStyle()),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: 300.0,
                  child: CupertinoDatePicker(
                    //backgroundColor: CupertinoColors.systemRed,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (dateTime) {
                    },
                  ),
                );
              }
            );
          },
          child: Text("Tap me"),
        ),
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