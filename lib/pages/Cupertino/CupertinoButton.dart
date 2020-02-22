import 'package:flutter/cupertino.dart';

class MyCupertinoButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoButton> {
  var titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

  var buttonTextStyle = new TextStyle(
  //fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino", style: titleTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          borderRadius: new BorderRadius.circular(30.0),
          onPressed: () {
          },
          child: Text('ダイアログを表示します', style: buttonTextStyle),
        ),
      ),
    );
  }
}
