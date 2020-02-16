import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/pages/SettingScreen.dart';
import 'package:http/http.dart' as http;

import 'ListViewScreen.dart';
import 'QiitaScreen.dart';

class FlutterIssuesScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Issues',
      //theme: ThemeData(
      //  primarySwatch: Colors.blue,
      //),
      theme: ThemeData.dark() ,
      home: MyHomePage(title: 'Flutter Issues'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}



class Issue {
  Issue({
    this.title,
    this.avatarUrl,
  });

  final String title;
  final String avatarUrl;
}

class _MyHomePageState1 extends State<MyHomePage> {
  List<Issue> _issues = <Issue>[];

  // ページ切り替え用のコントローラを定義
  PageController _pageController;
  // ページインデックス保存用
  int _screen = 0;
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('Flutter Issues'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: const Text('Qiita Items'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: const Text('Setting'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screen, // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    );
    _load();
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  Future<void> _load() async {
    final res = await http.get('https://api.github.com/repositories/31792824/issues');
    final data = json.decode(res.body);
    setState(() {
      final issues = data as List;
      issues.forEach((dynamic element) {
        final issue = element as Map;
        _issues.add(Issue(
          title: issue['title'] as String,
          avatarUrl: issue['user']['avatar_url'] as String,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  var _city = '';
    return Scaffold(
      /*
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Flutter Issues',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                //setState(() => _city = 'Setting');
                Navigator.pop(context);
                setState(() => _onPressed);
              },
            ),
            ListTile(
              title: Text('Honolulu'),
              onTap: () {
                setState(() => _city = 'Honolulu, HI');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),*/
      appBar: AppBar(
        title: Text(widget.title),
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= _issues.length) {
            return null;
          }

          final issue = _issues[index];
          return ListTile(
            leading: ClipOval(
              child: Image.network(issue.avatarUrl),
            ),
            title: Text(issue.title),
          );
        },
      ),
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
}

