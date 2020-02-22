import 'package:flutter/cupertino.dart';
import 'package:flutter_my_app/pages/SettingScreen.dart';
import 'BottomNavigationBar.dart';
import 'GridViewScreen.dart';
import 'HelloWorld.dart';

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
        if(i==0)  return HelloWorld();
        else if(i==1)  return Setting();
        else  return MyGridView();
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