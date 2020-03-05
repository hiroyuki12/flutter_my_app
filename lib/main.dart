import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_my_app/pages/Cupertino/CupertinoGridView.dart';
import 'package:flutter_my_app/pages/Material/DatePicker.dart';
import 'package:flutter_my_app/pages/Material/FloatingActionButton.dart';
import 'package:flutter_my_app/pages/Material/RadioListTile.dart';
import 'package:flutter_my_app/pages/Material/RaisedButton.dart';
import 'package:flutter_my_app/pages/Material/TextField.dart';
import 'pages/Cupertino/CupertinoActionSheet.dart';
import 'pages/Cupertino/CupertinoActivityIndicator.dart';
import 'pages/Cupertino/CupertinoAlertDialog.dart';
import 'pages/Cupertino/CupertinoBuildingLayouts.dart';
import 'pages/Cupertino/CupertinoButton.dart';
import 'pages/Cupertino/CupertinoCamera.dart';
import 'pages/Cupertino/CupertinoDatePicker.dart';
import 'pages/Cupertino/CupertinoFlutterIssues.dart';
import 'pages/Cupertino/CupertinoHelloWorld.dart';
import 'pages/Cupertino/CupertinoListView.dart';
import 'pages/Cupertino/CupertinoLocalAuthentication.dart';
import 'pages/Cupertino/CupertinoMenu.dart';
import 'pages/Cupertino/CupertinoMenu2.dart';
import 'pages/Cupertino/CupertinoMenu3.dart';
import 'pages/Cupertino/CupertinoPicker.dart';
import 'pages/Cupertino/CupertinoPlatform.dart';
import 'pages/Cupertino/CupertinoProvider.dart';
import 'pages/Cupertino/CupertinoQiita.dart';
import 'pages/Cupertino/CupertinoSegmentedControl.dart';
import 'pages/Cupertino/CupertinoSettings.dart';
import 'pages/Cupertino/CupertinoSlider.dart';
import 'pages/Cupertino/CupertinoSwitch.dart';
import 'pages/Cupertino/CupertinoTextField.dart';
import 'pages/Cupertino/CupertinoTimerPicker.dart';
import 'pages/Cupertino/CupertinoTwitter.dart';
import 'pages/Cupertino/CupertinoWebView.dart';
import 'pages/Gallery/CupertinoNavigationBar.dart';
import 'pages/Gallery/CupertinoSegmentedControlDemo.dart';
import 'pages/Material/BottomSheet.dart';
import 'pages/Material/Container.dart';
import 'pages/Material/Drawer.dart';
import 'pages/Material/FlatButton.dart';
import 'pages/Material/LoremPicsumScreen.dart';
import 'pages/Material/Navigator.dart';
import 'pages/Material/Navigator2.dart';
import 'pages/Material/AlertDialog.dart';
import 'pages/Material/Card.dart';
import 'pages/Material/Checkbox.dart';
import 'pages/Material/CounterScreen.dart';
import 'pages/Cupertino/CupertinoScreen.dart';
import 'pages/Cupertino/CupertinoTabBar.dart';
import 'pages/Material/FileRWScreen.dart';
import 'pages/Cupertino/CupertinoHome.dart';
import 'pages/Material/HelloWorld.dart';
import 'pages/Material/HomeMaterial.dart';
import 'pages/Material/LayoutScreen.dart';
import 'pages/Material/ListView2Screen.dart';
import 'pages/Material/ListViewScreen.dart';
import 'pages/Material/OutlineButton.dart';
import 'pages/Material/ProviderScreen.dart';
import 'pages/Material/Row.dart';
import 'pages/Material/SettingScreen.dart';
import 'pages/Material/FlutterIssuesScreen.dart';
import 'pages/Material/Qiita.dart';
import 'pages/Material/Slider.dart';
import 'pages/Material/Stack.dart';
import 'pages/Material/SwitchListTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      theme: ThemeData(
       // This is the theme of your application.
       primarySwatch: Colors.blue,
       backgroundColor: CupertinoColors.black,
       scaffoldBackgroundColor: CupertinoColors.black,
       dialogBackgroundColor: CupertinoColors.black,
      ),
      // theme: ThemeData.dark(),
      // theme: ThemeData.light(),
      // debugShowCheckedModeBanner: false,
      
      // initialRoute: '/home',
      // initialRoute: '/cupertinoMenu',
      initialRoute: '/cupertinoQiita',
      
      routes: {
        '/helloWorld': (context) => HelloWorld(),
        '/cupertinoHelloWorld': (context) => CupertinoHelloWorld(),
        '/flutterIssues': (context) => FlutterIssues(),
        '/cupertinoFlutterIssues': (context) => CupertinoFlutterIssues(),
        '/qiita': (context) => Qiita(),
        '/cupertinoQiita': (context) => CupertinoQiita(),
        '/setting': (context) => Setting(),
        '/cupertinoSettings': (context) => CupertinoSettings(),
        '/listView': (context) => MyListView(),
        '/cupertinoListView': (context) => MyCupertinoListView(),
        '/listView2': (context) => ListView2(),
        '/layout': (context) => MyLayout(),
        '/navigator': (context) => MyNavigator(),
        '/navigator2': (context) => MyNavigator2(),
        '/fileRW': (context) => FileRW(),
        '/drawer': (context) => Drawer(),
        '/provider': (context) => MyProvider(),
        '/cupertinoProvider': (context) => CupertinoProvider(),
        '/counter': (context) => Counter(),
        '/cupertino': (context) => CupertinoScreen(),
        '/cupertinoHome': (context) => CupertinoHome(),
        '/home': (context) => MyHomeMaterial(),
        '/home2': (context) => Home(),
        '/next': (context) => Next(),
        '/alertDialog': (context) => MyAlertDialog(),
        '/cupertinoAlertDialog': (context) => MyCupertinoAlertDialog(),
        '/bottomSheet': (context) => MyBottomSheet(),
        '/card': (context) => MyCard(),
        '/checkbox': (context) => MyCheckbox(),
        '/container': (context) => MyContainer(),
        '/datePicker': (context) => MyDatePicker(),
        '/cupertinoDatePicker': (context) => MyCupertinoDatePicker(),
        '/drawer': (context) => MyDrawer(),
        '/floatingActionButton': (context) => MyFloatingActionButton(),
        '/flatButton': (context) => MyFlatButton(),
        '/loremPicsum': (context) => LoremPicsum(),
        '/outlineButton': (context) => MyOutlineButton(),
        '/raisedButton': (context) => MyRraisedButton(),
        '/cupertinoButton': (context) => MyCupertinoButton(),
        '/radioListTile': (context) => MyRadioListTile(),
        '/row': (context) => MyRow(),
        '/slider': (context) => MySlider(),
        '/cupertinoSlider': (context) => MyCupertinoSlider(),
        '/stack': (context) => MyStack(),
        '/switchListTile': (context) => MySwitchListTile(),
        '/textField': (context) => MyTextField(),
        '/cupertinoTextField': (context) => MyCupertinoTextField(),
        '/cupertinoTwitter': (context) => CupertinoTwitter(),
        '/cupertinoPlartform': (context) => CuperinoPlatform(),
        '/cupertinoActionSheet': (context) => MyCupertinoActionSheet(),

        '/cupertinoMenu': (context) => CupertinoMenu(),
        '/cupertinoMenu2': (context) => CupertinoMenu2(),
        '/cupertinoMenu3': (context) => CupertinoMenu3(),
        '/cupertinoActivityIndicator': (context) => MyCupertinoActivityIndicator(),
        '/cupertinoBuildingLayouts': (context) => CupertinoBuildingLayouts(),
        '/cupertinoGridView': (context) => MyCupertinoGridView(),
        '/cupertinoPicker': (context) => MyCupertinoPicker(),
        '/cupertinoSegmentedControl': (context) => MyCupertinoSegmentedControl(),
        '/cupertinoSwitch': (context) => MyCupertinoSwitch(),
        '/cupertinoTabBar': (context) => MyCupertinoTabBar(),
        '/cupertinoWebView': (context) => MyCupertinoWebView(),
        '/cupertinoSegmentedControlDemo': (context) => CupertinoSegmentedControlDemo(),
        '/cupertinoNavigationBarDemo': (context) => CupertinoNavigationBarDemo(),
        '/cupertinoTimerPicker': (context) => MyCupertinoTimerPicker(),
        '/cupertinoLocalAuthentication': (context) => CupertinoLocalAuthentication(),
        '/cupertinoCamera': (context) => CupertinoCamera(),
        
        
      },
      // home: MyHomeMaterial(title: 'main'),  //BottomNavigationBar
      
      home: CupertinoMenu(),                     //CupertinoMenu (no BottomBar)
      // home: CupertinoHome(),                     //CupertinoTabBar (Bottom)
      
      // Twitter
      // home: CupertinoTwitter(),                     //CupertinoTwitter
    );
  }
}
