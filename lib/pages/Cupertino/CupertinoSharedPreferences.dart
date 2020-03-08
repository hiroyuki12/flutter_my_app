import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DarkModeColor.dart';

class CupertinoSharedPreferences extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoSharedPreferences> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // 初期化時にShared Preferencesに保存している値を読み込む
    _getCounter();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino SharedPreferences", style: _buildTextStyle()),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              onPressed: _incrementCounter,
              child: Text('Increment Counter', style: _buttonTextStyleNoBackground),
            ),
            Text(_counter.toString(), style: _buildTextStyle()),
            CupertinoButton(
              onPressed: _removeCounter,
              child: Text('Remove Counter', style: _buttonTextStyleNoBackground),
            ),
          ],
        ),
      ),
    );
  }

  void _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
    });
    print('Pressed $_counter times.');
    await prefs.setInt('counter', _counter);
  }

  void _removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
    });
    print('Removed counter.');
    await prefs.remove('counter');
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