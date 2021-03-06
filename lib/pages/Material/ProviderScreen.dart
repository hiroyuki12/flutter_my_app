import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterStore with ChangeNotifier {
  var count = 0;

  void incrementCounter() {
    count++;
    notifyListeners();
  }
}

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: ChangeNotifierProvider(
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
        return Scaffold(
          body: Center(child: Text('${counterStore.count}')),
          floatingActionButton: FloatingActionButton(
            onPressed: counterStore.incrementCounter,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}