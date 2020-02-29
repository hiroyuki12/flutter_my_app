import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMenu.dart';
import 'DarkModeColor.dart';

class CupertinoClose extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoClose> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino CLose", style: _buildTitleTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          borderRadius: new BorderRadius.circular(30.0),
          onPressed: () {
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   new MaterialPageRoute(
            //       builder: (context) => new CupertinoMenu()),
            //   (_) => false);
          },
          child: Text('CupertinoClose!', style: _buttonTextStyle),
        ),
      ),
    );
  }
}

TextStyle _buttonTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white
); //black , darkMode=white

var titleTextStyle = new TextStyle();
TextStyle _buildTitleTextStyle() {
  return titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
