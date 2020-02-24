import 'package:flutter/material.dart';

class MyNavigator extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Push Flutter Issues'),
          onPressed: ()=> Navigator.pushNamed(context, '/flutterIssues'),
        ),
      ),
    );
  }
}
