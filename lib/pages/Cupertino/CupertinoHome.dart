import 'package:flutter/cupertino.dart';
import 'package:flutter_my_app/pages/Material/FlutterIssuesScreen.dart';
import 'package:flutter_my_app/pages/Material/LoremPicsumScreen.dart';
import 'package:flutter_my_app/pages/Material/SettingScreen.dart';
import 'CupertinoFlutterIssues.dart';
import 'CupertinoGridView.dart';
import 'CupertinoHelloWorld.dart';
import 'CupertinoSettings.dart';
import 'CupertinoTwitter.dart';
import 'CupertinoWebView.dart';

class CupertinoHome extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color(0xff333333),  //dark mode
        items: [
          BottomNavigationBarItem(
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
        //else  return CupertinoTwitter();
        else  return CupertinoFlutterIssues();
        
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