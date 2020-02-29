import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyBottomSheet> {
  var label = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Options'),
          onPressed: _showModalBottomSheet,
        ),
      ),
    );
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                setState(() => label = 'You selected Share');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              onTap: () {
                setState(() => label = 'You selected Edit');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                setState(() => label = 'You selected Delete');
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
