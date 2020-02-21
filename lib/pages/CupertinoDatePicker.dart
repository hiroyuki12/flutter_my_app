import 'package:flutter/cupertino.dart';

class MyCupertinoDatePicker extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoDatePicker> {
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
          showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300.0,
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (dateTime) {
                          // TODO: do something in here
                        },
                      ),
                    );
                  });
            },
          child: Text("Tap me"),
        ),
      ),
    );
  }
}
