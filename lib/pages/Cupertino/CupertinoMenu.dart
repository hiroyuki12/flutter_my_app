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
        middle: Text("Cupertino Menu", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        // child: Text("Hello World!", style: _buildTextStyle(),),

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
              child: Text('Push Cupertino Platform'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoPlartform'),
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
              child: Text('Push Cupertino Settings'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSettings'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoListView'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoListView'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Provider'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoProvider'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoAlertDialog'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoAlertDialog'),
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
              child: Text('Push CupertinoTextField'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTextField'),
            ),
            CupertinoButton(
              child: Text('NEXT PAGE ( Push CupertinoMenu2)'),
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
