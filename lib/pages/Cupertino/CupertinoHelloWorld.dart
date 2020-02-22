import 'package:flutter/cupertino.dart';

class CupertinoHelloWorld extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoHelloWorld> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Hello World", style: new TextStyle(
          fontWeight: FontWeight.w100,
          decoration: TextDecoration.none,
          color: CupertinoColors.white)),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: Text("Hello World2!", 
          style: new TextStyle(
            fontWeight: FontWeight.w100,
            decoration: TextDecoration.none,
            fontSize: 16,
            color: CupertinoColors.white),
          ),
      ),
    );
  }
}
