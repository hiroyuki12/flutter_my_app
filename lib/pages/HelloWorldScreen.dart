import 'package:flutter/material.dart';

class HelloWorld extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelloWorld! Material"),
      ),
      body: Center(
        child: Text('Hello World!',),
      ),
    );
  }
}
