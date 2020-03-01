import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'DarkModeColor.dart';

class CounterStore with ChangeNotifier {
  var count = 0;

  void incrementCounter() {
    count++;
    notifyListeners();
  }
}

class CupertinoProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoProvider", style: _buildFont()),
      ),
      child: ChangeNotifierProvider(
        create: (context) => CounterStore(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterStore>(
      builder: (context, counterStore, _) {
        return CupertinoPageScaffold(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('${counterStore.count}', style: _buildFont(),),
                CupertinoButton(
                  child: Text('Count up'),
                  onPressed: counterStore.incrementCounter,
                ),
              ],
            )
          ),
        );
      },
    );
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildFont() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
