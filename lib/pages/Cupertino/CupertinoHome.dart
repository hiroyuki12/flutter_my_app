import 'package:flutter/cupertino.dart';
import 'package:flutter_my_app/pages/Material/FlutterIssuesScreen.dart';
import 'package:flutter_my_app/pages/Material/LoremPicsumScreen.dart';
import 'package:flutter_my_app/pages/Material/SettingScreen.dart';
import 'CupertinoActionSheet.dart';
import 'CupertinoActivityIndicator.dart';
import 'CupertinoAlertDialog.dart';
import 'CupertinoBuildingLayouts.dart';
import 'CupertinoButton.dart';
import 'CupertinoDatePicker.dart';
import 'CupertinoFlutterIssues.dart';
import 'CupertinoGridView.dart';
import 'CupertinoHelloWorld.dart';
import 'CupertinoListView.dart';
import 'CupertinoPicker.dart';
import 'CupertinoPlatform.dart';
import 'CupertinoProvider.dart';
import 'CupertinoQiita.dart';
import 'CupertinoScreen.dart';
import 'CupertinoSegmentedControl.dart';
import 'CupertinoSettings.dart';
import 'CupertinoSlider.dart';
import 'CupertinoSwitch.dart';
import 'CupertinoTabBar.dart';
import 'CupertinoTextField.dart';
import 'CupertinoTwitter.dart';
import 'CupertinoTwitterHome.dart';
import 'CupertinoWebView.dart';
import 'DarkModeColor.dart';

class CupertinoHome extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoHome> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        // backgroundColor: const Color(0xff333333),  //dark mode
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        items: [
          BottomNavigationBarItem(
            backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.mail),
          ),
        ]
      ), 
      tabBuilder: (context, i) {
        if(i==0)  return CupertinoHelloWorld();
        else if(i==1)  return CupertinoSettings();
        else if(i==2)  return Setting();
        // else  return CupertinoTwitterHome();
        // else  return CupertinoTwitter();
        else  return CupertinoWebView();
        
        //else  return MyBottomNavigationBar();

        // return CupertinoTabView(
        //   builder: (context) {
        //     return _buildCupertinoTabView(context, i);
        //   }
        // );
      }
    );
  }
}