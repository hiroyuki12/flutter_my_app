import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ListViewScreen.dart';
import 'SettingScreen.dart';


class QiitaScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita',
      //theme: ThemeData(
      //  primarySwatch: Colors.blue,
      //),
      theme: ThemeData.dark() ,
      home: MyHomePage2(title: 'Qiita'),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class Item {
  Item({
    this.title,
    this.profileImageUrl,
  });

  final String title;
  final String profileImageUrl;
}

class _MyHomePageState2 extends State<MyHomePage2> {
  List<Item> _items = <Item>[];

  get http => null;

  @override
  void initState() {
    super.initState();
    _load();
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
        title: Text('Qiita2'),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.add),
            onPressed: _onPressed,
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
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0), 
            child: FloatingActionButton(
            heroTag: "btn3",
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.home),
              onPressed: _onFloattingHomeButtonPressed,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            //テキスト
            Text('Hello Text'),
            //ボタン(iPhoneっぽく)
            CupertinoButton(
                child: Text('pop'),
                onPressed: _onPopPressed,
            ),           
          ]
        )
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
      ),
      */
    );
  }


  //フローティングのHOMEボタン押下時
  void _onFloattingHomeButtonPressed() {
    //Navigator.pushNamed(context, '/setting');
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
    setState(() {

    });
  }
  
  //フローティングのーボタン押下時
  void _onFloattingRemoveButtonPressed() {
    //Navigator.pushNamed(context, '/setting');
    Navigator.push(context, MaterialPageRoute(builder: (context) => QiitaScreen()));
    setState(() {

    });
  }

  //フローティングの＋ボタン押下時
  void _onPressed() {
    //Navigator.pushNamed(context, '/setting');
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewScreen()));
    setState(() {

    });
  }

  //OKボタン押下時
  void _onPopPressed() {
    setState(() {
      
    });
    //Navigator.pop(context);
  }
}