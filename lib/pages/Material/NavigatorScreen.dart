import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation with Routes',
    routes: <String, WidgetBuilder>{
      '/': (_) => new Splash(),
      '/login': (_) => new Login(),
      '/home': (_) => new Home(),
      '/next': (_) => new Next(),
    },
  ));
}

// ---------
// スプラッシュ
// ---------
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 3))
        .then((value) => handleTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        // TODO: スプラッシュアニメーション
        child: const CircularProgressIndicator(),
      ),
    );
  }

  void handleTimeout() {
    // ログイン画面へ
    Navigator.of(context).pushReplacementNamed("/login");
  }
}

// ---------
// ログイン画面
// ---------
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Login"),
      ),
      body: new Center(
        child: new Form(
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'User Id',
                  ),
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  maxLength: 8,
                  decoration: new InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: new RaisedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      // TODO: ログイン処理
                      // ホーム画面へ
                      Navigator.of(context).pushReplacementNamed("/home");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------
// ホーム画面
// ---------
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Home"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: const Text("Launch Next Screen"),
          onPressed: () {
            // その他の画面へ
            Navigator.of(context).pushNamed("/next");
          },
        ),
      ),
    );
  }
}

// ---------
// その他画面
// ---------
class Next extends StatefulWidget {
  @override
  _NextState createState() => new _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Next"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            const SizedBox(height: 24.0),
            new RaisedButton(
              child: const Text("Launch Next Screen"),
              onPressed: () {
                // その他の画面へ
                Navigator.of(context).pushNamed("/next");
              },
            ),
            const SizedBox(height: 24.0),
            new RaisedButton(
              child: const Text("Home"),
              onPressed: () {
                // ホーム画面へ戻る　
                Navigator.popUntil(context, ModalRoute.withName("/home"));
              },
            ),
            const SizedBox(height: 24.0),
            new RaisedButton(
              child: const Text("Logout"),
              onPressed: () {
                // 確認ダイアログ表示
                showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return new AlertDialog(
                      content: const Text('Do you want logout?'),
                      actions: <Widget>[
                        new FlatButton(
                          child: const Text('No'),
                          onPressed: () {
                            // 引数をfalseでダイアログ閉じる
                            Navigator.of(context).pop(false);
                          },
                        ),
                        new FlatButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            // 引数をtrueでダイアログ閉じる
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                ).then<void>((aBool) {
                  // ダイアログがYESで閉じられたら...
                  if (aBool) {
                    // 画面をすべて除いてスプラッシュを表示
                    Navigator.pushAndRemoveUntil(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Splash()),
                        (_) => false);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}