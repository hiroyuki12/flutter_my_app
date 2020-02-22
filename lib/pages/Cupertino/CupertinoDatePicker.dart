import 'package:flutter/cupertino.dart';

class MyCupertinoDatePicker extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoDatePicker> {
  var titleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoDatePicker", style: titleTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return Container(
                  height: 300.0,
                  child: CupertinoDatePicker(
                    //backgroundColor: CupertinoColors.systemRed,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (dateTime) {
                    },
                  ),
                );
              }
            );
          },
          child: Text("Tap me"),
        ),
      ),
    );
  }
}
