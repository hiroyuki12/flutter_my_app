import 'package:flutter/cupertino.dart';

class MyCupertinoTextField extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyCupertinoTextField> {
  TextEditingController _textController;

  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoTextField", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        child: 
          CupertinoTextField(controller: _textController,),
      ),
    );
  }
}
