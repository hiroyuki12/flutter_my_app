import 'package:flutter/cupertino.dart';

class MyCupertinoAlertDialog extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoAlertDialog> {
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
          showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Warning"),
                      content: Text("Are you sure want to delete this data?"),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text("No"),
                          onPressed: () {
                            // TODO: do something in here
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text("Yes"),
                          onPressed: () {
                            // TODO: do something in here
                          },
                          isDestructiveAction: true,
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
