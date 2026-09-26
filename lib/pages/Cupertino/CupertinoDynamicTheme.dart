import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DarkModeColor.dart';


// class MyCupertinoDynamicTheme2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MyCupertinoDynamicTheme(
      
//     );
//   }
// }

// dynamic_theme パッケージ（廃止）の代わりに、明暗の切り替えを自前で保持する
class MyCupertinoDynamicTheme extends StatefulWidget {
  @override
  State<MyCupertinoDynamicTheme> createState() => DynamicThemeState();
}

class DynamicThemeState extends State<MyCupertinoDynamicTheme> {
  Brightness _brightness = Brightness.light;

  static DynamicThemeState of(BuildContext context) =>
      context.findAncestorStateOfType<DynamicThemeState>()!;

  void setBrightness(Brightness brightness) {
    setState(() => _brightness = brightness);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: _brightness,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // isDarkMode = false;  // switch darkMode
    return CupertinoPageScaffold(
      //backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino DynamicTheme", style: _buildTextStyle()),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              onPressed: changeTheme,
              child: Text('Change Theme', style: _buttonTextStyleNoBackground),
            ),
            CupertinoButton(
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoMenu2'),
              child: Text('Menu2', style: _buttonTextStyleNoBackground),
            ),
          ],
        ),
      ),
    );
  }

  // テーマ変更
  void changeTheme() {
    DynamicThemeState.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
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