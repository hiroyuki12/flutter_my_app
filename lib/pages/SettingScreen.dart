import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(
      MaterialApp(home: SettingScreen()),
    );

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

enum Fruits { Apple, Orange, Grape }

class _State extends State<SettingScreen> {
  String _text = 'Enter something...';
  var _radVal = Fruits.Apple;
  String _radValText = "";
  int count = 0;
  String _message = 'Tap this button.';
  var _checkBox1 = false;
  var _checkBox2 = false;
  bool _switchActive = false;
  var _switchValue = true;
  var _switchTitle = 'Switch Test';
  var _labelText = 'Select Date';
  String _label = '';
  String _labelSimpleDialog = '';
  String _labelModalBottomSheet = '';
  String _time = '';
  List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    Timer.periodic(
      Duration(seconds: 1),
      _onTimer,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onPressed,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            //テキスト
            Text('Hello Text'),
            //チェックボックス
            Checkbox(
              value: _checkBox1,
              onChanged: (bool value) {
                setState(() {
                  _checkBox1 = value;
                });
              },
            ),
            /*
            //チェックボックスリスト
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
            */
            /*
            //スイッチ
            Switch(
              value: _switchActive,
              // activeColor: Colors.orange,
              // activeTrackColor: Colors.red,
              // inactiveThumbColor: Colors.blue,
              // inactiveTrackColor: Colors.green,
              onChanged: _changeSwitch,
            ),
            */
            //スイッチ(iPhoneっぽく)
            CupertinoSwitch(
              value: _switchActive,
              // activeColor: Colors.orange,
              // activeTrackColor: Colors.red,
              // inactiveThumbColor: Colors.blue,
              // inactiveTrackColor: Colors.green,
              onChanged: _changeSwitch,
            ),
            /*
            //スイッチリスト
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
            */
            /*
            //ボタン
            RaisedButton(
                child: Text('OK'),
                onPressed: _onPressed,
            ),           
            Text(_message),
            */
            //ボタン(iPhoneっぽく)
            CupertinoButton(
                child: Text('OK'),
                onPressed: _onPressed,
            ),           
            Text(_message),
            /*
            //テキストフィールド
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                //hintText: 'Username',
                icon: Icon(Icons.account_circle),
              ),
              autocorrect: false,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _userNameChanged,
              onSubmitted: _userNameSubmitted,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                //hintText: 'Password',
                icon: Icon(Icons.security),
              ),
              autocorrect: false,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: _passwordChanged,
              onSubmitted: _passwordSubmitted,
            ),
            Text(_text),
            */
            /*
            //ラジオボタン
            RadioListTile(
                title: Text('Orange'),
                value: Fruits.Orange,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Apple'),
                value: Fruits.Apple,
                groupValue: _radVal,
                onChanged: _onChanged),
            RadioListTile(
                title: Text('Grape'),
                value: Fruits.Grape,
                groupValue: _radVal,
                onChanged: _onChanged),
            Text(_radValText),
            */
            //日付選択
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () => _selectDate(context),
            ),
            Text(_labelText),
            /*
            //日付選択(iPhoneっぽく)
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () => _selectDateCupertino(context),
            ),
            Text(_labelText),
            */
            /*
            //アラートダイアログ
            RaisedButton(
                child: Text(
                  'AlertDialog',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => _showAlertDialog(context),
                color: Theme.of(context).primaryColor,
              ),
            Text(_label),
            */
            //アラートダイアログ(ボタンをiPhoneっぽく)
            CupertinoButton(
                child: Text(
                  'AlertDialog',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => _showAlertDialog(context),
                color: Theme.of(context).primaryColor,
              ),
            Text(_label),
            /*
            //シンプルダイアログ
            RaisedButton(
              child: Text('Please select'),
              onPressed: _showSimpleDialog,
            ),
            Text(_labelSimpleDialog),
            */
            /*
            //プログレスインジケーター Indeterminate
            LinearProgressIndicator(),
            CircularProgressIndicator(),
            */
            //タイマー
            Text(
              _time,
              style: TextStyle(
                fontSize: 60.0,
                fontFamily: 'IBMPlexMono',
              ),
            ),
            /*
            //モーダルボトムシート
            RaisedButton(
                child: Text('Show options'),
                onPressed: _showModalBottomSheet,
              ),
            Text(_labelModalBottomSheet),
            */
            //iPhoneっぽいボタン
            CupertinoButton(
              color: Colors.blue,
              borderRadius: new BorderRadius.circular(30.0),
              onPressed: () {
                showDialog(
                    context: context,
                    child: new CupertinoAlertDialog(
                      title: new Column(
                        children: <Widget>[
                          new Text("テストダイアログ"),
                        ],
                      ),
                      //actions: <Widget>[new FlatButton(child: new Text("OK"),onPressed: () => _selectDate(context),)],
                      actions: <Widget>[new FlatButton(child: new Text("OK"),onPressed: () => Navigator.pop(context))],
                      
                    ));
              },
              child: Text('ダイアログを表示します'),
            ),
            //ドロップダウンリスト
            Text("Please choose a fruit: "),
            DropdownButton(
              value: _selectedFruit,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            )
          ],
        ),
      ),
    );
  }

  //ボタン押下時
  void _onPressed() {
    setState(() {
      ++count;
      _message = 'Tap count $count';
    });
  }

  //テキストフィールド変更時
  void _userNameChanged(String value) {
    setState(() {
      _text = 'Changed: $value';
    });
  }
  void _userNameSubmitted(String value) {
    setState(() {
      _text = 'Submitted $value';
    });
  }
  void _passwordChanged(String value) {
    setState(() {
      _text = 'Changed: $value';
    });
  }
  void _passwordSubmitted(String value) {
    setState(() {
      _text = 'Submitted $value';
    });
  }

  //スイッチ変更時
  void _changeSwitch(bool e) => setState(() => _switchActive = e);

  //ラジオボタン変更時
  void _onChanged(Fruits value) {
    if(value == Fruits.Orange)  _radValText = "Orange";
    else if(value == Fruits.Apple)  _radValText = "Apple";
    else if(value == Fruits.Grape)  _radValText = "Grape";

    setState(() {
      _radVal = value;
    });
  }

  //日付選択ボタン押下時
  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (selected != null) {
      setState(() {
        _labelText = (DateFormat.yMMMd()).format(selected);
      });
    }
  }

  /*
  //日付選択ボタン押下時(iPhoneっぽく)
  Future<void> _selectDateCupertino(BuildContext context) {
    final DateTime selected = DateTime.now();
    CupertinoDatePicker(
      use24hFormat: true,
      minimumDate: DateTime.now(),
      onDateTimeChanged: (selected) {},
    );
    if (selected != null) {
      setState(() {
        _labelText = (DateFormat.yMMMd()).format(selected);
      });
    }
  }
  */
  //アラートダイアログ
  Future _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Use camera?'),
          content: Text('Description goes here.'),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () => _useCamera(context, false),
            ),
            FlatButton(
              child: Text('AGREE'),
              onPressed: () => _useCamera(context, true),
            ),
          ],
        );
      },
    );
  }
  
  //アラートダイアログ
  _useCamera(BuildContext context, bool b) {
    setState(() {
      _label = 'You select ' + (b ? 'AGREE' : 'CANCEL');
    });
    Navigator.pop(context);
  }

  Future _showSimpleDialog() async {
    String result = "";
    result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select account'),
          children: <Widget>[
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.shade200,
                  child: Text(
                    'U1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text('user1@keicode.com'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  "user1",
                );
              },
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  child: Text(
                    'U2',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text('user2@gmail.com'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  "user2",
                );
              },
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                title: Text('Add account'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  "Add account",
                );
              },
            ),
          ],
        );
      },
    );
    _setLabel(result);
  }

  //シンプルダイアログ
  void _setLabel(String s) {
    if (s == null) {
      return;
    }
    setState(() => _labelSimpleDialog = s);
  }

  //タイマー
  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm:ss');
    var formattedTime = formatter.format(now);
    setState(() => _time = formattedTime);
  }

  //モーダルボトムシート
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
                setState(() => _labelModalBottomSheet = 'You selected Share');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
              onTap: () {
                setState(() => _labelModalBottomSheet = 'You selected Edit');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                setState(() => _labelModalBottomSheet = 'You selected Delete');
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  //ドロップダウンリスト
  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  //ドロップダウンリスト
  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }
}