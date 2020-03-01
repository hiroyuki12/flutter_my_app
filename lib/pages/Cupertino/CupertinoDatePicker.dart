import 'package:flutter/cupertino.dart';
import 'DarkModeColor.dart';

class MyCupertinoDatePicker extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoDatePicker> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoDatePicker", style: _buildTextStyle()),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            _buildButton(context, CupertinoDatePickerMode.dateAndTime, 'dateAndTime'),
            _buildButton(context, CupertinoDatePickerMode.date, 'date'),
            _buildButton(context, CupertinoDatePickerMode.time, 'time'),
          ],
        ),
      ),
    );
  }
}

Widget _buildButton(BuildContext context, CupertinoDatePickerMode mode, String text) {
  return CupertinoButton(
    onPressed: () {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: 300.0,
            child: CupertinoDatePicker(
              // backgroundColor: CupertinoColors.systemRed,
              initialDateTime: DateTime.now(),
              mode: mode, //date, dateAndTime, time
              onDateTimeChanged: (dateTime) {
              },
            ),
          );
        }
      );
    },
    child: Text(text),
  );
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}