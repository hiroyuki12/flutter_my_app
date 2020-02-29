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
        middle: Text("Cupertino Menu2", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        // child: Text("Hello World!", style: _buildTextStyle(),),

        child: Column(
          children: <Widget>[
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
