import 'package:flutter/cupertino.dart';

class MyCupertinoSlider extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoSlider> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino", style: new TextStyle(color: CupertinoColors.white)),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: CupertinoSlider(
          onChanged: (value) {
            // TODO: do something in here
          },
          value: 0.5,
        ),
      ),
    );
  }
}