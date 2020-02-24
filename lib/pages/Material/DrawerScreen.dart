import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyDrawer> {
  var _city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'My App'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Los Angeles'),
              onTap: () {
                setState(() {
                  _city = 'Los Angeles, CA';
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text('Honolulu'),
              onTap: () {
                setState(() {
                  _city = 'Honolulu, HI';
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),),
      body: Text(_city),
    );
  }
}
