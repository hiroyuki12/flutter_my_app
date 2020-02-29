import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'DarkModeColor.dart';

class MyCupertinoWebView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoWebView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        // leading: CupertinoButton(
        //   onPressed: () {
        //     // _controller.loadUrl('https://youtube.com/');
        //     _controller.loadUrl('https://flutter.dev/');
        //   },
        //   child: Text('Flutter', style: _buildTextStyle()),
        // ),
        middle: Text("CupertinoWebView", style: _buildTextStyle()),
        trailing: CupertinoButton(
          onPressed: () {
            _controller.loadUrl('https://flutter.dev/');
          },
          child: Text('Flutter', style: _buildTextStyle()),
        ),
        // backgroundColor: const Color(0xff333333),
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      ),
      child: Center(
        child: WebView(
          initialUrl: 'https://youtube.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;
          },
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
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
