import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'FlutterIssuesScreen.dart';
import 'SettingScreen.dart';

class ListView2Screen extends StatefulWidget {
  //MyHomePage2({Key key, this.title}) : super(key: key);
  //final String title;

  //@override
  //_State createState() => _State();
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}
/*
class ListViewScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage2(title: 'ListView'),
    );
  }
}
*/

class Item {
  Item({
    this.title,
    this.profileImageUrl,
  });

  final String title;
  final String profileImageUrl;
}

class _State extends State<ListView2Screen> {
  List<Map<String, dynamic>> items = [
    { "title" : "Title A",  "content" : "Content 1" },
    { "title" : "Title B",  "content" : "Content 2" },
    { "title" : "Title C",  "content" : "Content 3" }
  ];

  List<Item> _items = <Item>[];

  @override
  void initState() {
    super.initState();
    //_load();
  }
  // This widget is the root of your application.
  Future<void> _load() async {
    final res = await http.get('http://qiita.com/api/v2/items');
    final data = json.decode(res.body);
    setState(() {
      final issues = data as List;
      issues.forEach((dynamic element) {
        final issue = element as Map;
        _items.add(Item(
          title: issue['title'] as String,
          profileImageUrl: issue['user']['profile_image_url'] as String,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text(widget.title),
          title: Text("ListView2"),
        ),

      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.add),
            onPressed: _onFloattingAddButtonPressed,
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0), 
            child: FloatingActionButton(
            heroTag: "btn2",
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.remove),
              onPressed: _onFloattingRemoveButtonPressed,
            ),
          ),
          /*
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0), 
            child: FloatingActionButton(
            heroTag: "btn3",
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.home),
              onPressed: _onFloattingHomeButtonPressed,
            ),
            
          ),*/
        ],
      ),
      /*
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _items.length) {
            return null;
          }

          final issue = _items[index];
          return ListTile(
            leading: ClipOval(
              child: Image.network(issue.profileImageUrl),
            ),
            title: Text(issue.title),
          );
        },
      ),*/
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            
            return Dismissible(
              // KeyはFlutterが要素を一意に特定できるようにするための値を設定する。
              key: Key(item["title"]),

              // onDismissedの中にスワイプされた時の動作を定義する。
              // directionにはスワイプの方向が入るため、方向によって処理を分けることができる。
              onDismissed: (direction) {
                setState(() {
                  // スワイプされた要素をデータから削除する
                  items.removeAt(index);
                });
                // スワイプ方向がendToStart（画面左から右）の場合の処理
                if (direction == DismissDirection.endToStart) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("削除しました"))
                  );
                // スワイプ方向がstartToEnd（画面右から左）の場合の処理  
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("登録しました"))
                  );
                }
              },
              // スワイプ方向がendToStart（画面左から右）の場合のバックグラウンドの設定
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.greenAccent[700],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                  child:  Icon(Icons.thumb_up, color: Colors.white)
                ),
              ),

              // スワイプ方向がstartToEnd（画面右から左）の場合のバックグラウンドの設定
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                color: Colors.orangeAccent[200],
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                  child:  Icon(Icons.thumb_up, color: Colors.white),
                ),
              ),

              // ListViewの各要素の定義
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text(item["title"] + " : " + item["content"]),
                ),
              ),
            );
          }),
    );
  }

  //フローティングの＋ボタン押下時
  void _onFloattingAddButtonPressed() {
    setState(() {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => NewScreen()));

      items.add({ "title" : "Title H",  "content" : "Content 9" });
    });
  }

  //フローティングのーボタン押下時
  void _onFloattingRemoveButtonPressed() {
    setState(() {
      //items.add({"title": "Title G", "content": "Content 7"});

      items = [
          {"title": "Title A", "content": "Content 1"},
          {"title": "Title B", "content": "Content 2"},
          {"title": "Title C", "content": "Content 3"}];

      //Navigator.pop(context);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
    });
  }

  //フローティングのHOMEボタン押下時
  void _onFloattingHomeButtonPressed() {
    //Navigator.pop(context);
    setState(() {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterIssuesScreen()));
    });
  }
}

