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
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,  //下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton.extended(
              heroTag: "btn1",
            label: Text('Add'),
            icon: Icon(Icons.add),
            onPressed: () => setState(() => _count++),
          ),
          Container(  //余白のため
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.remove),
              onPressed: () => setState(() => _count--),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(_count.toString(),),
      ),
    );
  }
}
