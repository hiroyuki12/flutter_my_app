import 'package:flutter/material.dart';

class MyRraisedButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyRraisedButton> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RraisedButton"),
      ),
      body: Center(
        child: RaisedButton(
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


