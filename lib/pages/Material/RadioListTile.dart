import 'package:flutter/material.dart';

class MyRadioListTile extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

enum Fruits { Apple, Orange, Grape }
String _radValText = "";

class _State extends State<MyRadioListTile> {
  var _radVal = Fruits.Apple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioListTile"),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile(
                title: Text('Orange'),
                value: Fruits.Orange,
                groupValue: _radVal,
                onChanged: _onChanged
              ),
              RadioListTile(
                title: Text('Apple'),
                value: Fruits.Apple,
                groupValue: _radVal,
                onChanged: _onChanged
              ),
              RadioListTile(
                title: Text('Grape'),
                value: Fruits.Grape,
                groupValue: _radVal,
                onChanged: _onChanged
              ),
              Text(_radValText),
            ],
          ),
      ),
    );
  }

  //ラジオボタン変更時
  void _onChanged(Fruits value) {
    if(value == Fruits.Orange)  _radValText = "Orange";
    else if(value == Fruits.Apple)  _radValText = "Apple";
    else if(value == Fruits.Grape)  _radValText = "Grape";

    setState(() {
      _radVal = value;
    });
  }
}
