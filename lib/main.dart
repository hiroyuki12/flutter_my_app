import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/Material/CounterScreen.dart';
import 'pages/Cupertino/CupertinoScreen.dart';
import 'pages/Cupertino/CupertinoTabBar.dart';
import 'pages/Material/FileRWScreen.dart';
import 'pages/Cupertino/CupertinoHelloWorld.dart';
import 'pages/Cupertino/CupertinoHome.dart';
import 'pages/Material/LayoutScreen.dart';
import 'pages/Material/ListView2Screen.dart';
import 'pages/Material/ListViewScreen.dart';
import 'pages/Material/NavigatorScreen.dart';
import 'pages/Material/ProviderScreen.dart';
import 'pages/Material/SettingScreen.dart';
import 'pages/Material/FlutterIssuesScreen.dart';
import 'pages/Material/QiitaScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      // theme: ThemeData(
      //  // This is the theme of your application.
      //  primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark(),
      //theme: ThemeData.light(),
      
      initialRoute: '/helloWorld',
      
      routes: {
        '/helloWorld': (context) => CupertinoHelloWorld(),
        '/flutterIssues': (context) => FlutterIssues(),
        '/qiita': (context) => Qiita(),
        '/setting': (context) => Setting(),
        '/listView': (context) => MyListView(),
        '/listView2': (context) => ListView2(),
        '/layout': (context) => MyLayout(),
        '/navigator': (context) => Login(),
        '/fileRW': (context) => FileRW(),
        '/drawer': (context) => Drawer(),
        '/provider': (context) => Provider(),
        '/counter': (context) => Counter(),
        '/cupertino': (context) => CupertinoScreen(),
        '/cupertinoTabBar': (context) => MyCupertinoTabBar(),
        '/home': (context) => CupertinoHome(),
      },
      // home: MyBottomNavigationBar(title: 'main'),  //BottomNavigationBar
      home: CupertinoHome(),                     //CupertinoTabBar (Bottom)
    );
  }
}
