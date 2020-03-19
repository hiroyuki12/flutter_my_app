import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'DarkModeColor.dart';

class MyCupertinoWebView extends StatefulWidget {
  MyCupertinoWebView({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoWebView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      // backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoWebView", style: _buildTextStyle()),
        trailing: GestureDetector(
          onTap: () => FlutterShare.share(
              title: 'title', text: widget.title, linkUrl: widget.url),
          // chooserTitle: widget.title),
          child: Icon(
            CupertinoIcons.share,
            color: CupertinoColors.systemGrey,
          ),
        ),
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
      ),
      child: Center(
        child: WebView(
          initialUrl: widget.url,
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
    color: isDarkMode ? darkModeForeColor : foreColor, //black , darkMode=white
  );
}
