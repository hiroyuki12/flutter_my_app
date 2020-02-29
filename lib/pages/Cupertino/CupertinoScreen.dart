import 'package:flutter/cupertino.dart';
import 'DarkModeColor.dart';

class CupertinoScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoScreen> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoTabScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      tabBar: CupertinoTabBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
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
            title: Text('ListViewScreen'),
          ),
        ]
      ), 
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return _buildCupertinoTabView(context, i);
          }
        );
      }
    );
  }
}

Widget _buildCupertinoTabView(BuildContext context, int i) => CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(
    backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
    middle: Text('Cupertino', style: _buildFont()),
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