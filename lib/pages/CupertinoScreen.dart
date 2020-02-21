import 'package:flutter/cupertino.dart';

class CupertinoScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoScreen> {
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
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (context) {
                        return DetailScreen(i == 0 ? 'Articles' : 'Views');
                      }),
                    );
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

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.topic);
  final String topic;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: Center(
        child: Text('Details for $topic',
        style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle)
      )
    );
  }
}