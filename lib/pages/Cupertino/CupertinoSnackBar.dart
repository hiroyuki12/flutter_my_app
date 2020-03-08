import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DarkModeColor.dart';

class CupertinoSnackBar extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoSnackBar> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return MaterialApp(
      home: CupertinoPageScaffold(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        navigationBar: CupertinoNavigationBar(
          middle: Text("Cupertino SnackBar", style: _buildTextStyle()),
          backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        ),
        child: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SnackBarBody(),);
  }
}

class SnackBarBody extends StatefulWidget {
  SnackBarBody({Key key,}):super(key: key);

  @override
  _SnackBarBodyState createState() => new _SnackBarBodyState();
}

class _SnackBarBodyState extends State<SnackBarBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CupertinoButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(label: 'Undo',
                  onPressed: () {},
                ),
              );
              // Find the Scaffold in the Widget tree and use it to show a SnackBar!
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar', style: _buttonTextStyleNoBackground),
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