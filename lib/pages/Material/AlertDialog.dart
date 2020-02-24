import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'AlertDialog',
            //style: TextStyle(
            //  color: Colors.white,
            //),
          ),
          onPressed: () => _showAlertDialog(context),
          //color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

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

  _useCamera(BuildContext context, bool b) {
    setState(() {
      //_label = 'You select ' + (b ? 'AGREE' : 'CANCEL');
      print('You select ' + (b ? 'AGREE' : 'CANCEL'));
    });
    Navigator.pop(context);
  }
}

  
