import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyFloatingActionButton> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => _count++),
      ),
      body: Center(
        child: Text(_count.toString(),),
      ),
    );
  }
}
