import 'package:flutter/cupertino.dart';
import 'DarkModeColor.dart';

class CupertinoMenu extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoMenu> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino Menu", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: Text('Push Cupertino Home'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoHome'),
            ),
            CupertinoButton(
              child: Text('Push Hello World'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoHelloWorld'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Flutter Issues'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoFlutterIssues'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Qiita'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoQiita'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Flutter Advent Calender'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoAdvent'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Camera'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoCamera'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino BarcodeReader'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoBarcodeReader'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Twitter'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTwitter'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino BuildingLayouts'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoBuildingLayouts'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino SharedPreferences'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSharedPreferences'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Settings'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSettings'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoListView'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoListView'),
            ),
            CupertinoButton(
              child: Text('NEXT PAGE (Push CupertinoMenu2)'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoMenu2'),
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
