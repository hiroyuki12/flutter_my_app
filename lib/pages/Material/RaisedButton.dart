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
        child: ElevatedButton(
          child: Text('OK'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
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


