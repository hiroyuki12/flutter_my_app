import 'package:flutter/material.dart';

class MyOutlineButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyOutlineButton> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OutlineButton"),
      ),
      body: Center(
        child: OutlineButton(
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


