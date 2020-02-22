import 'package:flutter/cupertino.dart';
import 'package:flutter_my_app/main.dart';
import 'package:flutter_my_app/pages/SettingScreen.dart';
import 'HelloWorld.dart';

class MyHome extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            title: Text('Setting'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.refresh),
            title: Text('Home'),
          ),
        ]
      ), 
      tabBuilder: (context, i) {
        if(i==0)  return HelloWorld();
        else if(i==1)  return Setting();
        //else  return MyGridView();
        else  return MyHomePage();
        
        // return CupertinoTabView(
        //   builder: (context) {
        //     return _buildCupertinoTabView(context, i);
        //   }
        // );
      }
    );
  }
}

Widget _buildCupertinoTabView(BuildContext context, int i) => CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(
    middle: Text('Cupertino'),
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
            //return DetailScreen(i == 0 ? 'Articles' : 'Views');
            return HelloWorld();
          }),
        );
      },
    ),
  ),
);

/*
class DetailScreen extends StatefulWidget {
  const DetailScreen(this.topic);
  final String topic;

  @override
  DetailScreenState createState() {
    return new DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  bool switchValue = false;
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                child: Text('Launch action sheet'),
                onPressed: () {
                  showCupertinoModalPopup<int>(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text('Some choices!'),
                        actions: [
                          CupertinoActionSheetAction(
                            child: Text('One!'),
                            onPressed: () {
                              Navigator.pop(context, 1);
                            },
                            isDefaultAction: true,
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Two!'),
                            onPressed: () {
                              Navigator.pop(context, 2);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Three!'),
                            onPressed: () {
                              Navigator.pop(context, 3);
                            },
                          ),
                        ],
                      );
                    }
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/