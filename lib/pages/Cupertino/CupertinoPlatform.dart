import 'dart:io';
import 'package:flutter/cupertino.dart';

class CuperinoPlatform extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CuperinoPlatform> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CuperinoPlatform", style: myTextStyle),
        //trailing: Text("Edit", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: Text(
          Platform.isIOS ? "iOS!" : "Not iOS!",
          style: myTextStyle,),
      ),
    );
  }
}
