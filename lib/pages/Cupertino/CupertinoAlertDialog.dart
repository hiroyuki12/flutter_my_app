import 'package:flutter/cupertino.dart';

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
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoAlertDialog", style: _buildTextStyle()),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text("Warning"),
                  content: Text("Are you sure want to delete this data?"),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Yes"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isDestructiveAction: true,
                    ),
                  ],
                );
              }
            );
          },
          child: Text("Tap me",),
        ),
      ),
    );
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
