import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DarkModeColor.dart';

class MyCupertinoListView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoListView> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoListView", style: _myTextStyle),
      ),
      child: Center(
        child: 
        ListView.builder(
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
                  title: Text(item["title"] + " : " + item["content"]),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _items = [
  { "title" : "Title A",  "content" : "Content 1" },
  { "title" : "Title B",  "content" : "Content 2" },
  { "title" : "Title C",  "content" : "Content 3" }
];

var _myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white
);