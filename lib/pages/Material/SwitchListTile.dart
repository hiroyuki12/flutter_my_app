import 'package:flutter/material.dart';

class MySwitchListTile extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MySwitchListTile> {
  var _switchValue = true;
  var _switchTitle = 'Switch Text';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("SwitchListTile"),
        ),
        body: SwitchListTile(
          value: _switchValue, 
          title: Text(_switchTitle),
          onChanged: (bool value) {
            setState(() {
              _switchValue = value;
              _switchTitle = 'Switch value = $_switchValue';
            });
          }),
    );
  }
}
