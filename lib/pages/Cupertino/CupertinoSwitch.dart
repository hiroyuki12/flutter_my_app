import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoSwitch extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

bool _lights = false;

class _State extends State<MyCupertinoSwitch> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSwitch", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Row(
        children: [
          Text('Lights', style: myTextStyle,),
          CupertinoSwitch(
            value: _lights,
            onChanged: (bool value) { setState(() { _lights = value; }); },
          ),
        ],
      ),
    );
  }
}

