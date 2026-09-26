import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'DarkModeColor.dart';

class CupertinoShare extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoShare> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor:
          isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
        middle: Text("Cupertino Hello World", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        // child: Text("Hello World!", style: _buildTextStyle(),),
        child: CupertinoButton(
            child: Text('Share'),
            onPressed: () =>
                SharePlus.instance.share(ShareParams(text: 'check out my website https://example.com'))),
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
    color: isDarkMode ? darkModeForeColor : foreColor, //black , darkMode=white
  );
}
