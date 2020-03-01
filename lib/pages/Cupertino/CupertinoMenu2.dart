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
              child: Text('Push CupertinoActionSheet'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoActionSheet'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoActivityIndicator'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoActivityIndicator'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino BuildingLayouts'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoBuildingLayouts'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoGridView'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoGridView'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoPicker'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoPicker'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoSegmentedControl'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSegmentedControl'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoSwitch'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSwitch'),
            ),
            // CupertinoButton(
            //   child: Text('Push CupertinoTabBar'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTabBar'),
            // ),
            CupertinoButton(
              child: Text('Push Cupertino WebView'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoWebView'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Twitter'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTwitter'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino TabBar'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTwitter'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoSlidingSegmentedControl'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSlidingSegmentedControl'),
            ),
            CupertinoButton(
              child: Text('Push cupertinoSegmentedControlDemo'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSegmentedControlDemo'),
            ),
            // CupertinoButton(
            //   child: Text('Push cupertinoNavigationBarDemo'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoNavigationBarDemo'),
            // ),
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
