import 'package:flutter/cupertino.dart';

class MyCupertinoActionSheet extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoActionSheet> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino", style: new TextStyle(color: CupertinoColors.white)),
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
                        // TODO: do something in here
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Main Game"),
                      onPressed: () {
                        // TODO: do something in here
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Menulis"),
                      onPressed: () {
                        // TODO: do something in here
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
