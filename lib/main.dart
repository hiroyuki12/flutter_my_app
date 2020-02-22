import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/BuildingLayoutsScreen.dart';
import 'pages/ContainerScreen.dart';
import 'pages/CounterScreen.dart';
import 'pages/Cupertino/CupertinoActionSheet.dart';
import 'pages/Cupertino/CupertinoActivityIndicatorScreen.dart';
import 'pages/Cupertino/CupertinoAlertDialog.dart';
import 'pages/Cupertino/CupertinoButton.dart';
import 'pages/Cupertino/CupertinoDatePicker.dart';
import 'pages/Cupertino/CupertinoScreen.dart';
import 'pages/Cupertino/CupertinoSlider.dart';
import 'pages/Cupertino/CupertinoTabBarScreen.dart';
import 'pages/FileRWScreen.dart';
import 'pages/HelloWorld.dart';
import 'pages/LayoutScreen.dart';
import 'pages/ListView2Screen.dart';
import 'pages/ListViewScreen.dart';
import 'pages/LoremPicsumScreen.dart';
import 'pages/NavigatorScreen.dart';
import 'pages/ProviderScreen.dart';
import 'pages/RowScreen.dart';
import 'pages/SettingScreen.dart';
import 'pages/FlutterIssuesScreen.dart';
import 'pages/QiitaScreen.dart';
import 'pages/StackScreen.dart';
import 'pages/example/animated_list.dart';
import 'pages/example/app_bar_bottom.dart';
import 'pages/example/basic_app_bar.dart';
import 'pages/example/custom_a11y_traversal.dart';
import 'pages/example/custom_semantics.dart';
import 'pages/example/expansion_tile_sample.dart';
import 'pages/example/tabbed_app_bar.dart';
import 'pages/stocks/main.dart';

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
        title: const Text('MyContainer'),
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
          MyContainer(),
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
