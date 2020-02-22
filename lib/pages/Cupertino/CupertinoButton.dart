import 'package:flutter/cupertino.dart';

class MyCupertinoButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino", style: new TextStyle(color: CupertinoColors.white)),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
          },
          child: Text("Tap me"),
        ),
      ),
    );
  }
}
