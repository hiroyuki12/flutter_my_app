import 'package:flutter/material.dart';
import 'LayoutHeader.dart';

class MyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyLayout> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: 
        Row(
          children: <Widget>[
            Text("Layout"),
            SpaceBox.width(16),
            Text("Layout2"),
          ],
        ),
      );
  }
}

class SpaceBox extends SizedBox {
  SpaceBox({double width = 8, double height = 8})
      : super(width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}