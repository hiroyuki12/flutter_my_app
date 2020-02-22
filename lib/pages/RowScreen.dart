import 'package:flutter/cupertino.dart';

class MyRow extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyRow> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Row", style: new TextStyle(color: CupertinoColors.white)),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/lake.jpg', width: 100,),
                Image.asset('images/lake.jpg', width: 100,),
              ],
            ),
            Image.asset('images/lake.jpg', width: 100,),
            Image.asset('images/lake.jpg', width: 100,),
          ],
        ),
      ),
    );
  }
}
