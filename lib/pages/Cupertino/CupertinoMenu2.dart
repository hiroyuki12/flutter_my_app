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
              child: Text('Push Cupertino SqliteViewer'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSqliteViewer'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino LocalFile'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoLocalFile'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Provider'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoProvider'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoButton'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoButton'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino Settings'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSettings'),
            ),
            CupertinoButton(
              child: Text('Push Cupertino WebView'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoWebView'),
            ),
            CupertinoButton(
              child: Text('Push CupertinoLocalAuthentication'),
              onPressed: ()=> Navigator.pushNamed(context, '/cupertinoLocalAuthentication'),
            ),
            // CupertinoButton(
            //   child: Text('Push CupertinoDatePicker'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoDatePicker'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoSlider'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSlider'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino Platform'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoPlartform'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoAlertDialog'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoAlertDialog'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoTextField'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTextField'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoActionSheet'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoActionSheet'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoActivityIndicator'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoActivityIndicator'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoGridView'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoGridView'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoPicker'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoPicker'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoSegmentedControl'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSegmentedControl'),
            // ),
            // CupertinoButton(
            //   child: Text('NEXT PAGE ( Push CupertinoMenu3)'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoMenu3'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino SharedPreferences'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSharedPreferences'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoSwitch'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSwitch'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino TabBar'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTwitter'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoSlidingSegmentedControl'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSlidingSegmentedControl'),
            // ),
            // CupertinoButton(
            //   child: Text('Push cupertinoSegmentedControlDemo'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSegmentedControlDemo'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoTimePicker'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTimerPicker'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino SignInButton'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSignInButton'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino CupertinoButton2'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoButton2'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Last Day'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/lastDayListView'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino SnackBar'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoSnackBar'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino DarkMode Flag'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoDarkModeFlag'),
            // ),
            // CupertinoButton(
            //   child: Text('Push Cupertino Share'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoShare'),
            // ),
            // CupertinoButton(
            //   child: Text('Push CupertinoListView'),
            //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoListView'),
            // ),
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
