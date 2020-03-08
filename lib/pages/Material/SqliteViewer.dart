import 'package:flutter/material.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

class SqliteViewer extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SqliteViewer> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqliteViewer"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('SqliteViewer'),
          // onPressed: _onPressed,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DatabaseList())),
        ),
      ),
    );
  }

  // void _onPressed() {
  //   Navigator.push(context, MaterialPageRoute(builder: (_) => DatabaseList()));
  // }
}


