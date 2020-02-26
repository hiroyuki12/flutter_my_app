import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/pages/Material/DatePicker.dart';
import 'package:flutter_my_app/pages/Material/FloatingActionButton.dart';
import 'package:flutter_my_app/pages/Material/RadioListTile.dart';
import 'package:flutter_my_app/pages/Material/RaisedButton.dart';
import 'package:flutter_my_app/pages/Material/TextField.dart';
import 'pages/Cupertino/CupertinoTwitter.dart';
import 'pages/Material/BottomSheet.dart';
import 'pages/Material/Container.dart';
import 'pages/Material/Drawer.dart';
import 'pages/Material/FlatButton.dart';
import 'pages/Material/LoremPicsumScreen.dart';
import 'pages/Material/Navigator.dart';
import 'pages/Material/Navigator2.dart';
import 'pages/Material/AlertDialog.dart';
import 'pages/Material/Card.dart';
import 'pages/Material/Checkbox.dart';
import 'pages/Material/CounterScreen.dart';
import 'pages/Cupertino/CupertinoScreen.dart';
import 'pages/Cupertino/CupertinoTabBar.dart';
import 'pages/Material/FileRWScreen.dart';
import 'pages/Cupertino/CupertinoHome.dart';
import 'pages/Material/HelloWorld.dart';
import 'pages/Material/HomeMaterial.dart';
import 'pages/Material/LayoutScreen.dart';
import 'pages/Material/ListView2Screen.dart';
import 'pages/Material/ListViewScreen.dart';
import 'pages/Material/OutlineButton.dart';
import 'pages/Material/ProviderScreen.dart';
import 'pages/Material/Row.dart';
import 'pages/Material/SettingScreen.dart';
import 'pages/Material/FlutterIssuesScreen.dart';
import 'pages/Material/Qiita.dart';
import 'pages/Material/Slider.dart';
import 'pages/Material/Stack.dart';
import 'pages/Material/SwitchListTile.dart';

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
      
      initialRoute: '/home',
      
      routes: {
        '/helloWorld': (context) => HelloWorld(),
        '/flutterIssues': (context) => FlutterIssues(),
        '/qiita': (context) => Qiita(),
        '/setting': (context) => Setting(),
        '/listView': (context) => MyListView(),
        '/listView2': (context) => ListView2(),
        '/layout': (context) => MyLayout(),
        '/navigator': (context) => MyNavigator(),
        '/navigator2': (context) => MyNavigator2(),
        '/fileRW': (context) => FileRW(),
        '/drawer': (context) => Drawer(),
        '/provider': (context) => MyProvider(),
        '/counter': (context) => Counter(),
        '/cupertino': (context) => CupertinoScreen(),
        '/cupertinoTabBar': (context) => MyCupertinoTabBar(),
        '/cupertinoHome': (context) => CupertinoHome(),
        '/home': (context) => MyHomeMaterial(),
        '/home2': (context) => Home(),
        '/next': (context) => Next(),
        '/alertDialog': (context) => MyAlertDialog(),
        '/bottomSheet': (context) => MyBottomSheet(),
        '/card': (context) => MyCard(),
        '/checkbox': (context) => MyCheckbox(),
        '/container': (context) => MyContainer(),
        '/datePicker': (context) => MyDatePicker(),
        '/drawer': (context) => MyDrawer(),
        '/floatingActionButton': (context) => MyFloatingActionButton(),
        '/flatButton': (context) => MyFlatButton(),
        '/loremPicsum': (context) => LoremPicsum(),
        '/outlineButton': (context) => MyOutlineButton(),
        '/raisedButton': (context) => MyRraisedButton(),
        '/radioListTile': (context) => MyRadioListTile(),
        '/row': (context) => MyRow(),
        '/slider': (context) => MySlider(),
        '/stack': (context) => MyStack(),
        '/switchListTile': (context) => MySwitchListTile(),
        '/textField': (context) => MyTextField(),
      },
      // home: MyHomeMaterial(title: 'main'),  //BottomNavigationBar
      home: CupertinoHome(),                     //CupertinoTabBar (Bottom)
      //home: CupertinoTwitter(),                     //CupertinoTwitter
    );
  }
}
