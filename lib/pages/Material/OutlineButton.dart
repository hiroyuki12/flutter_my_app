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
        title: Text("OutlinedButton"),
      ),
      body: Center(
        child: OutlinedButton(
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


