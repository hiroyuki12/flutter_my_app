import 'package:flutter/cupertino.dart';
import 'DarkModeColor.dart';

class CupertinoMenu2 extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoMenu2> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino Menu2", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: Text('Push Cupertino Provider'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoProvider'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoDatePicker'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoDatePicker'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoButton'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoButton'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoSlider'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSlider'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Platform'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoPlartform'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoAlertDialog'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoAlertDialog'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoTextField'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTextField'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoActionSheet'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoActionSheet'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoActivityIndicator'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoActivityIndicator'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoGridView'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoGridView'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoPicker'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoPicker'),
            ),
            // CupertinoButton(
            //   child: Text('Push CupertinoTabBar'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTabBar'),
            // ),
            // CupertinoButton(
            //   child: Text('Push cupertinoNavigationBarDemo'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoNavigationBarDemo'),
            // ),
            CupertinoButton(
              child: Text('Push CupertinoSegmentedControl'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSegmentedControl'),
            ),
            CupertinoButton(
              child: Text('NEXT PAGE ( Push CupertinoMenu3)'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoMenu3'),
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
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
