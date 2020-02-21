import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/CounterScreen.dart';
import 'pages/CupertinoActionSheet.dart';
import 'pages/CupertinoActivityIndicatorScreen.dart';
import 'pages/CupertinoAlertDialog.dart';
import 'pages/CupertinoButton.dart';
import 'pages/CupertinoDatePicker.dart';
import 'pages/CupertinoScreen.dart';
import 'pages/CupertinoSlider.dart';
import 'pages/CupertinoTabBarScreen.dart';
import 'pages/FileRWScreen.dart';
import 'pages/HelloWorld.dart';
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
        '/helloWorld': (context) => HelloWorld(),
        '/flutterIssues': (context) => FlutterIssuesScreen(),
        '/qiita': (context) => QiitaScreen(),
        '/setting': (context) => SettingScreen(),
        '/listView': (context) => ListViewScreen(),
        '/listView2': (context) => ListView2Screen(),
        '/layout': (context) => LayoutScreen(),
        '/navigator': (context) => Login(),
        '/fileRW': (context) => FileRW(),
        '/drawer': (context) => Drawer(),
        '/provider': (context) => Provider(),
        '/counter': (context) => Counter(),
        '/cupertino': (context) => CupertinoScreen(),
        '/cupertinoTabBar': (context) => CupertinoTabBarScreen(),
      },
      home: MyHomePage(title: 'main'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ページ切り替え用のコントローラを定義
  PageController _pageController;
  // ページインデックス保存用
  int _screen = 0;
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('HelloWorld'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: const Text('Setting'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.repeat),
        title: const Text('Cupertino'),
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
  }
/*
  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        controller: _pageController,
        // ページ切り替え時に実行する処理
        // PageViewのonPageChangedはページインデックスを受け取る
        // 以下ではページインデックスをindexとする
        onPageChanged: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;
          });
        },
        // ページ下部のナビゲーションメニューに相当する各ページビュー。後述
        children: [
          HelloWorld(),
          SettingScreen(),
          CupertinoTabBarScreen(),
        ]),
        // ページ下部のナビゲーションメニュー
        bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;

            // ページ遷移を定義。
            // curveで指定できるのは以下
            // https://api.flutter.dev/flutter/animation/Curves-class.html
            //_pageController.jumpToPage(index);
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}
