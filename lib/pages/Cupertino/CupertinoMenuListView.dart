import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DarkModeColor.dart';

class CupertinoMenuListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoMenuListView> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true; // switch darkMode

    List<Map<String, dynamic>> _items = [
      // {'title': 'Push Cupertino Home', 'content': '/cupertinoHome'},
      // {'title': 'Push Hello World', 'content': '/cupertinoHelloWorld'},
      // {
      //   'title': 'Push Cupertino Flutter Issues',
      //   'content': '/cupertinoFlutterIssues'
      // },
      // {'title': 'Push Cupertino Qiita', 'content': '/cupertinoQiita'},
      {
        'title': 'Push Cupertino SqliteViewer',
        'content': '/cupertinoSqliteViewer'
      },
      // {
      //   'title': 'Push Cupertino Flutter Advent Calender',
      //   'content': '/cupertinoAdvent'
      // },
      // {'title': 'Push Cupertino Camera', 'content': '/cupertinoCamera'},
      // {
      //   'title': 'Push Cupertino BarcodeReader',
      //   'content': '/cupertinoBarcodeReader'
      // },
      // {'title': 'Push Cupertino Twitter', 'content': '/cupertinoTwitter'},
      // {
      //   'title': 'Push Cupertino BuildingLayouts',
      //   'content': '/cupertinoBuildingLayouts'
      // },
      // { 'title' : 'Push Cupertino MenuListView',  'content' : '/cupertinoMenuListView' },
      // {
      //   'title': 'Push Cupertino SharedPreferences',
      //   'content': '/cupertinoSharedPreferences'
      // },

      {'title': 'Push Cupertino Provider', 'content': '/cupertinoProvider'},
      {
        'title': 'Push Cupertino MultiProvider',
        'content': '/cupertinoMultiProvider'
      },
      {'title': 'Push CupertinoDatePicker', 'content': '/cupertinoDatePicker'},
      {'title': 'Push CupertinoButton', 'content': '/cupertinoButton'},
      {'title': 'Push CupertinoSlider', 'content': '/cupertinoSlider'},
      {'title': 'Push Cupertino Platform', 'content': '/cupertinoPlartform'},
      {
        'title': 'Push CupertinoAlertDialog',
        'content': '/cupertinoAlertDialog'
      },
      {'title': 'Push CupertinoTextField', 'content': '/cupertinoTextField'},
      {
        'title': 'Push CupertinoActionSheet',
        'content': '/cupertinoActionSheet'
      },
      {
        'title': 'Push CupertinoActivityIndicator',
        'content': '/cupertinoActivityIndicator'
      },
      {'title': 'Push CupertinoGridView', 'content': '/cupertinoGridView'},
      {'title': 'Push CupertinoPicker', 'content': '/cupertinoPicker'},
      // { 'title' : 'Push CupertinoTabBar',  'content' : '/cupertinoTabBar' },
      // { 'title' : 'Push cupertinoNavigationBarDemo',  'content' : '/cupertinoNavigationBarDemo' },
      // { 'title' : 'Push CupertinoSegmentedControl',  'content' : '/cupertinoSegmentedControl' },

      {'title': 'Push CupertinoSwitch', 'content': '/cupertinoSwitch'},
      {'title': 'Push Cupertino WebView', 'content': '/cupertinoWebView'},
      // { 'title' : 'Push Cupertino TabBar',  'content' : '/cupertinoTwitter' },
      {
        'title': 'Push CupertinoSegmentedControlDemo',
        'content': '/cupertinoSegmentedControlDemo'
      },
      {'title': 'Push CupertinoTimePicker', 'content': '/cupertinoTimerPicker'},
      {
        'title': 'Push CupertinoLocalAuthentication',
        'content': '/cupertinoLocalAuthentication'
      },
      {
        'title': 'Push Cupertino SignInButton',
        'content': '/cupertinoSignInButton'
      },
      {
        'title': 'Push Cupertino CupertinoButton2',
        'content': '/cupertinoButton2'
      },
      {'title': 'Push Last Day', 'content': '/lastDayListView'}, //error
      {'title': 'Push Last Day', 'content': '/'},
      {'title': 'Push Cupertino LocalFile', 'content': '/cupertinoLocalFile'},
      {'title': 'Push Cupertino SnackBar', 'content': '/cupertinoSnackBar'},
      {'title': '', 'content': '/'},
      {'title': '', 'content': '/'},
      {'title': '', 'content': '/'},
      {'title': '', 'content': '/'},
      {'title': '', 'content': '/'},

      {'title': 'Push CupertinoMenu', 'content': '/cupertinoMenu'},
      {'title': 'Push CupertinoMenu2', 'content': '/cupertinoMenu2'},
      {'title': 'Push CupertinoMenu3', 'content': '/cupertinoMenu3'},
      {'title': '', 'content': '/'},
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
        middle: Text("Cupertino Menu ListView", style: _myTextStyle),
      ),
      child: Center(
        child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _items[index];
              return Dismissible(
                // KeyはFlutterが要素を一意に特定できるようにするための値を設定する。
                key: Key(item["title"]),
                // ListViewの各要素の定義
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text(item["title"]),
                    onTap: () => Navigator.pushNamed(context, item["content"]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

var _myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);
