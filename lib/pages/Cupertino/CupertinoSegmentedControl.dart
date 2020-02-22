import 'package:flutter/cupertino.dart';

class MyCupertinoSegmentedControl extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

var titleTextStyle = new TextStyle(
fontWeight: FontWeight.w100,
decoration: TextDecoration.none,
fontSize: 14,
color: CupertinoColors.white);

var controlTextStyle = new TextStyle(
fontWeight: FontWeight.w200,
decoration: TextDecoration.none,
fontSize: 12,
color: CupertinoColors.systemBlue);

class _State extends State<MyCupertinoSegmentedControl> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSegmentedControl", style: titleTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: Center(
        //child: Text("Hello World2!"),
        child: _buildCupertinoSegmentedControl(),
      ),
    );
  }
}

Widget _buildCupertinoSegmentedControl() {
   return CupertinoSegmentedControl(
     selectedColor: CupertinoColors.systemRed,  //変わらない
     unselectedColor: CupertinoColors.white,
     children: {
       "1": Text("Midnight", style: controlTextStyle,),
       "2": Text("Viridian", style: controlTextStyle,),
       "3": Text("Cerulean", style: controlTextStyle,),
     },
     onValueChanged: (value) {
       if (value == "1") {
         //_showCupertinoActionSheet(context);
       }
       if (value == "2") {
         //_showCupertinoPicker(context);
       }
       if (value == "3") {
         //_showCupertinoPicker(context);
       }
   },);
 }
