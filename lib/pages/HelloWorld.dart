import 'package:flutter/cupertino.dart';

class HelloWorld extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Hello World", style: new TextStyle(color: CupertinoColors.white)),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: Text("Hello World2!"),
      ),
    );
  }
}
