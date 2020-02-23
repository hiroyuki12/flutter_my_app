import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/CounterScreen.dart';
import 'pages/Cupertino/CupertinoScreen.dart';
import 'pages/Cupertino/CupertinoTabBarScreen.dart';
import 'pages/FileRWScreen.dart';
import 'pages/Cupertino/CupertinoHelloWorld.dart';
import 'pages/Cupertino/CupertinoHomeScreen.dart';
import 'pages/LayoutScreen.dart';
import 'pages/ListView2Screen.dart';
import 'pages/ListViewScreen.dart';
import 'pages/NavigatorScreen.dart';
import 'pages/ProviderScreen.dart';
import 'pages/SettingScreen.dart';
import 'pages/FlutterIssuesScreen.dart';
import 'pages/QiitaScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      //theme: ThemeData(
      //  // This is the theme of your application.
      //  primarySwatch: Colors.blue,
      //),
      theme: ThemeData.dark(),
      
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
        '/cupertinoTabBar': (context) => CupertinoTabBarScreen(),
        '/home': (context) => MyHome(),
      },
      // home: MyBottomNavigationBar(title: 'main'),  //BottomNavigationBar
      home: MyHome(),                     //CupertinoTabBar (Bottom)
    );
  }
}
