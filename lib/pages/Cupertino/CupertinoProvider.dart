import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CounterStore with ChangeNotifier {
  var count = 0;

  void incrementCounter() {
    count++;
    notifyListeners();
  }
}

class CupertinoProvider extends StatelessWidget {
  final myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoProvider", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
      ),
      child: ChangeNotifierProvider(
        create: (context) => CounterStore(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterStore>(
      builder: (context, counterStore, _) {
        return CupertinoPageScaffold(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('${counterStore.count}', style: myTextStyle,),
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