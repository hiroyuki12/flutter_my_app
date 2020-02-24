import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCheckbox> {
  var _checkBox1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: Center(
        child: Checkbox(
          value: _checkBox1,
          onChanged: (bool value) {
           setState(() {
            _checkBox1 = value;
           });
          },
        ),
      ),
    );
  }
}
