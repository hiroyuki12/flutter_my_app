import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CheckBox.dart';
import 'CounterScreen.dart';
import 'HelloWorldScreen.dart';
import 'RadioListTile.dart';
import 'RaisedButton.dart';
import 'SettingScreen.dart';
import 'SwitchListTile.dart';
import 'TextField.dart';

class MyHomeMaterial extends StatefulWidget {
  MyHomeMaterial({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeMaterialState createState() => _MyHomeMaterialState();
}

class _MyHomeMaterialState extends State<MyHomeMaterial> {
  // ページ切り替え用のコントローラを定義
  PageController _pageController;
  // ページインデックス保存用
  int _screen = 0;
  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: const Text(''),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.repeat),
        title: const Text(''),
      ),
    ];
  }

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
          Setting(),
          MyRadioListTile(),
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
}
