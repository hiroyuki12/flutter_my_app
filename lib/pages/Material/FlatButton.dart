import 'package:flutter/material.dart';

class MyFlatButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyFlatButton> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlatButton"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('OK'),
          onPressed: _onPressed,
        ),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      ++count;
      print(count.toString());
    });
  }
}


