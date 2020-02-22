import 'package:flutter/cupertino.dart';

class MyCupertinoActivityIndicator extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoActivityIndicator> {
  var titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoActivityIndicator", style: titleTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
