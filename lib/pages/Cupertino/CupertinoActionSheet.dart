import 'package:flutter/cupertino.dart';

class MyCupertinoActionSheet extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoActionSheet> {
  var titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoActionSheet", style: titleTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {showCupertinoModalPopup(context: context, builder: (context) {
                return CupertinoActionSheet(
                  title: Text("Hobbies"),
                  message: Text("Select your hobbie"),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Text("Coding"),
                      onPressed: () {
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Main Game"),
                      onPressed: () {
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Menulis"),
                      onPressed: () {
                      },
                    ),
                  ],
                );
              });
            },
          child: Text("Tap me"),
        ),
      ),
    );
  }
}
