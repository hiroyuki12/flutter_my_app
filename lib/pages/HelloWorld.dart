import 'package:flutter/cupertino.dart';
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
        title: Text("HelloWorld"),
      ),
      body: Column(
        children: <Widget>[
          Text('Hello World body'),
          CupertinoButton(
              child: Text('push setting'),
              //onPressed: ()=> Navigator.popUntil(context, ModalRoute.withName("/setting")),
              //onPressed: ()=> Navigator.of(context).pop(),
              onPressed: ()=> Navigator.pushNamed(context, '/setting'),
          ),
        ],
      ),
    );
  }
}
