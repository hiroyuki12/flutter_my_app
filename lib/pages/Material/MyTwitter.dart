import 'package:flutter/material.dart';

class MyTwitter extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyTwitter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter"),
      ),
      body: Center(
        child: Text('Hello World!',),
      ),
    );
  }
}
