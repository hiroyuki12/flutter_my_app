import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DarkModeColor.dart';

class MyCupertinoAlertDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoAlertDialog> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
        middle: Text("CupertinoAlertDialog", style: _buildTextStyle()),
      ),
      child: Center(
        child: _buildCupertinoButton(context),
      ),
    );
  }
}

Widget _buildCupertinoButton(BuildContext context) {
  return CupertinoButton(
    onPressed: () {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return _buildCupertinoAlertDiaglog(context);
          });
    },
    child: Text(
      "Tap me",
    ),
  );
}

Widget _buildCupertinoAlertDiaglog(BuildContext context) {
  // return false ?
  return CupertinoAlertDialog(
    title: Text("Warning"),
    content: Text("Are you sure want to delete this data?"),
    actions: <Widget>[
      CupertinoDialogAction(
        child: Text("No"),
        onPressed: () {
          print('No');
          Navigator.pop(context);
        },
      ),
      CupertinoDialogAction(
        child: Text("Yes"),
        onPressed: () {
          print('No');
          Navigator.pop(context);
        },
        isDestructiveAction: true,
      ),
    ],
  );
  // : showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Use camera?'),
  //         content: Text('Description goes here.'),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('CANCEL'),
  //             // onPressed: () => _useCamera(context, false),
  //             onPressed: () => print('CANCEL'),
  //           ),
  //           FlatButton(
  //             child: Text('AGREE'),
  //             // onPressed: () => _useCamera(context, true),
  //             onPressed: () => print('AGREE'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: isDarkMode ? darkModeForeColor : foreColor, //black , darkMode=white
  );
}
