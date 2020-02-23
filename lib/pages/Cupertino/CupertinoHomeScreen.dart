import 'package:flutter/cupertino.dart';
import 'package:flutter_my_app/pages/SettingScreen.dart';
import 'CupertinoHelloWorld.dart';
import 'CupertinoPicker.dart';
import 'CupertinoSettings.dart';

class MyHome extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color(0xff333333),
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            //title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            //title: Text('Setting'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            //title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.mail),
            //title: Text('Home'),
          ),
        ]
      ), 
      tabBuilder: (context, i) {
        if(i==0)  return CupertinoHelloWorld();
        else if(i==1)  return CupertinoSettings();
        else if(i==2)  return Setting();
        else  return MyCupertinoPicker();
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