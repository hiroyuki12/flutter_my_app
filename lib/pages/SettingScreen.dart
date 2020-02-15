import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(home: SettingScreen()),
    );

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SettingScreen> {

  int count = 0;
  String _message = 'Tap this button.';

  var _checkBox1 = false;
  var _checkBox2 = false;
  var _switchValue = true;
  var _switchTitle = 'Switch Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Checkbox(
              value: _checkBox1,
              onChanged: (bool value) {
                setState(() {
                  _checkBox1 = value;
                });
              },
            ),
            CheckboxListTile(
              value: _checkBox2,
              title: Text(
                'Checkbox 2 Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _checkBox2 = value;
                });
              },
            ),
            SwitchListTile(
              value: _switchValue,
              title: Text(
                _switchTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                  _switchTitle = 'Switch value = $_switchValue';
                });
              },
            ),
            Text(_message),
            RaisedButton(
                child: Text('OK'),
                onPressed: _onPressed,
              )
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    setState(() {
      ++count;
      _message = 'Tap count $count';
    });
  }
}