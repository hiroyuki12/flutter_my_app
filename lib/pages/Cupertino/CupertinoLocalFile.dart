import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import 'DarkModeColor.dart';


//テキストフィールドの状態を管理するためのクラス
final _textController = TextEditingController();
//出力するテキストファイル名
final _fileName = 'editTextField.txt';

//読み込んだテキストファイルを出力
String _out = '';

class CupertinoLocalFile extends StatefulWidget {
  CupertinoLocalFile({Key key, this.title}) : super(key: key);
  final String title;

  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoLocalFile> {
  @override
  Widget build(BuildContext context) {

    //ファイルの出力処理
    void _writeButton() async {
      getFilePath().then((File file) {
        // file.writeAsString(_textController.text);
        // file.writeAsString('Hello World 8!');
        file.writeAsString('Hello World 3!');
      });
    }

    //ファイルの読み込みと変数への格納処理
    void _loadButton() async {
      setState(() {
        load().then((String value) {
          setState(() {
            _out = value;
          });
        });
      });
    }

    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino LocalFile", style: _buildTextStyle()),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            // writeButton
            CupertinoButton(
              onPressed: () => _writeButton(),
              child: Text('writeAsString', style: _buttonTextStyleNoBackground),
            ),
            // locadButton
            CupertinoButton(
              onPressed: () => _loadButton(),
              child: Text('load', style: _buttonTextStyleNoBackground),
            ),
            Text('読み込みデータ', style: _buildTextStyle()),
            Text(_out, style: _buildTextStyle()),
          ],
        ),
      ),
    );
  }
}

//テキストファイルを保存するパスを取得する
Future<File> getFilePath() async {
  final directory = await getTemporaryDirectory();
  return File(directory.path + '/' + _fileName);
}

//テキストファイルの読み込み
Future<String> load() async {
  final file = await getFilePath();
  return file.readAsString();
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}

TextStyle  _buttonTextStyleNoBackground = new TextStyle(
  fontWeight: FontWeight.w300,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: CupertinoColors.activeBlue,  //black , darkMode=white
);