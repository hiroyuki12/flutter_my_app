import 'package:flutter/cupertino.dart';

class MyCupertinoPicker extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoPicker> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoPicker", style: myTextStyle),
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
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {},
                    itemExtent: 30.0,
                    children: <Widget>[
                      Center(child: Text("item 1")),
                      Center(child: Text("item 2")),
                      Center(child: Text("item 3")),
                      Center(child: Text("item 4")),
                      Center(child: Text("item 5")),
                    ],
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
