import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Username',
            icon: Icon(Icons.account_circle)
          ),
          autocorrect: false,
          autofocus: true,
          keyboardType: TextInputType.text,
          onChanged: _userNameChanged,
          onSubmitted: _userNameSubmitted,
        ),
      ),
    );
  }       

  void _userNameChanged(String value) {
    setState(() {
      print('Changed: $value');
    });
  }

  void _userNameSubmitted(String value) {
    setState(() {
      print('Submitted: $value');
    });
  }
}

