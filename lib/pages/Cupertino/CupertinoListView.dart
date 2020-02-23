import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoListView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class Item {
  Item({
    this.title,
    this.profileImageUrl,
  });

  final String title;
  final String profileImageUrl;
}

class _State extends State<MyCupertinoListView> {
  List<Map<String, dynamic>> items = [
    { "title" : "Title A",  "content" : "Content 1" },
    { "title" : "Title B",  "content" : "Content 2" },
    { "title" : "Title C",  "content" : "Content 3" }
  ];

  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoListView", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: 
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
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
