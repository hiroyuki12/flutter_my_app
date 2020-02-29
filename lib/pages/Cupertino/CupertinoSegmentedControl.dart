import 'package:flutter/cupertino.dart';

import 'DarkModeColor.dart';

class MyCupertinoSegmentedControl extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoSegmentedControl> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSegmentedControl", style: _buildFont()),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: 
        Row(
          children: <Widget>[
            Expanded(
              child: _buildCupertinoSegmentedControl(),
            ),
          ],
        ),
    );
  }
}

Widget _buildCupertinoSegmentedControl() {
   return CupertinoSegmentedControl(
    //  pressedColor: CupertinoColors.systemBlue,  //文字色がsystemBlue
     pressedColor: CupertinoColors.systemYellow,
     selectedColor: CupertinoColors.systemRed,  //変わらない
     unselectedColor: CupertinoColors.white,
     children: {
       "1": Text("Midnight", style: controlTextStyle,),
       "2": Text("Viridian", style: controlTextStyle,),
       "3": Text("Cerulean", style: controlTextStyle,),
     },
     onValueChanged: (value) {
       if (value == "1") {
         //_showCupertinoActionSheet(context);
       }
       if (value == "2") {
         //_showCupertinoPicker(context);
       }
       if (value == "3") {
         //_showCupertinoPicker(context);
       }
   },);
 }


var myTextStyle = new TextStyle();
TextStyle _buildFont() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}


var controlTextStyle = new TextStyle(
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
  fontSize: 12,
  color: CupertinoColors.systemBlue);