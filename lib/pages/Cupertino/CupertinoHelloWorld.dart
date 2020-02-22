import 'package:flutter/cupertino.dart';

class CupertinoHelloWorld extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoHelloWorld> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Hello World", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: Text("Hello World2!", style: myTextStyle,
          ),
      ),
    );
  }
}
