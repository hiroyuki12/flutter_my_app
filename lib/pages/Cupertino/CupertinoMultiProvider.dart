import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/pages/Gallery/CupertinoSegmentedControlDemo.dart';
import 'package:provider/provider.dart';

import 'DarkModeColor.dart';

class CounterStore with ChangeNotifier {
  var count = 0;

  void incrementCounter() {
    count++;
    notifyListeners();
  }
}

class LoginStore with ChangeNotifier {
  var email = "";
  var emailError = "";

  void changeEmail2() {
    // emailError = validate(email) ? "" : "メールアドレスを正しく入力してください";
    emailError = "メールアドレスを正しく入力してください";
    notifyListeners();
  }

  void changeEmail(String text) {
    email = text;
    emailError = validate(email) ? "" : "メールアドレスを正しく入力してください";
    notifyListeners();
  }

  bool validate(String email) {
    // validation処理を書く
  }
}

class CupertinoMultiProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor:
          isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
        middle: Text("CupertinoMultiProvider", style: _buildFont()),
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterStore()),
          ChangeNotifierProvider(create: (context) => LoginStore()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Consumer<CounterStore>(
    return Consumer<LoginStore>(
      // builder: (context, counterStore, _) {
      builder: (context, loginStore, _) {
        return CupertinoPageScaffold(
          child: Center(
              child: Column(
            children: <Widget>[
              // Text(
              //   '${counterStore.count}',
              //   style: _buildFont(),
              // ),
              // CupertinoButton(
              //   child: Text('Count up'),
              //   onPressed: counterStore.incrementCounter,
              // ),

              SizedBox(height: 50),
              // TextFormField(
              //   onChanged: (text) => loginStore.changeEmail(text),
              // ),
              CupertinoButton(
                child: Text('Push!'),
                onPressed: loginStore.changeEmail2,
              ),
              Text(
                '${loginStore.emailError}',
                style: myTextStyle,
              ), // エラーメッセージ
            ],
          )),
        );
      },
    );
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildFont() {
  return myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    // color: CupertinoColors.white
    color: isDarkMode ? darkModeForeColor : foreColor, //black , darkMode=white
  );
}
