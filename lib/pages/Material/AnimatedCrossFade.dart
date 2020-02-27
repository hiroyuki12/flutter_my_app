import 'package:flutter/material.dart';

class MyAnimatedCrossFade extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyAnimatedCrossFade> {
  bool _first = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedCrossFade(
            duration: const Duration(seconds: 3),
            firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
            secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          FlatButton(
            child: Text('Click Me!'),
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }

  void _onPressed() {
    setState(() {
      _first = !_first;
    });
  }
}

