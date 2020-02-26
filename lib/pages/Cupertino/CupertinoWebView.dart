import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CupertinoWebView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoWebView> {
  WebViewController _controller;
  
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {
            _controller.loadUrl('https://youtube.com/');
          },
          child: Text('YouTube', style: myTextStyle),
          ),
        middle: Text("CupertinoWebView", style: myTextStyle),
        trailing: CupertinoButton(
          onPressed: () {
            _controller.loadUrl('https://flutter.dev/');
          },
          child: Text('Flutter', style: myTextStyle),
          ),
        backgroundColor: const Color(0xff333333),
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
