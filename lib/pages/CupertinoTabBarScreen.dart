import 'package:flutter/cupertino.dart';

class CupertinoTabBarScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Articles'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views'),
          ),
        ]
      ), 
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (i == 0) ? Text('Articles') : Text('Views'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text(
                    'This is tab #$i',
                    style: CupertinoTheme.of(context)
                      .textTheme
                      .actionTextStyle
                      .copyWith(fontSize: 32),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/helloWorld');
                  },
                ),
              ),
            );
          }
        );
      }
    );
  }
}