import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'DarkModeColor.dart';

class MyCupertinoWebView extends StatefulWidget {
  MyCupertinoWebView({Key? key, this.url = '', this.title = ''}) : super(key: key);

  final String url;
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      // backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoWebView", style: _buildTextStyle()),
        trailing: GestureDetector(
          onTap: () => SharePlus.instance.share(ShareParams(
              title: 'title', text: '${widget.title} ${widget.url}')),
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
        child: WebViewWidget(controller: _controller),
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
