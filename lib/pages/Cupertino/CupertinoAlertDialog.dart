import 'package:flutter/cupertino.dart';

class MyCupertinoAlertDialog extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoAlertDialog> {
  var titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoAlertDialog", style: titleTextStyle),
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
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Yes"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isDestructiveAction: true,
                    ),
                  ],
                );
              }
            );
          },
          child: Text("Tap me",),
        ),
      ),
    );
  }
}
