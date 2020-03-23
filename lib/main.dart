import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoActionSheet.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoActivityIndicator.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoAdventCalender.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoAlertDialog.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoBarcodeReader.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoBuildingLayouts.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoButton.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoCamera.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoCovid19Issues.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoDarkModeFlag.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoDatePicker.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoDynamicTheme.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoFlutterIssues.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoGridView.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoHome.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoListView.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoLocalAuthentication.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoLocalFile.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMenu.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMenu2.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMenu3.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMenuListView.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMonitoringScroll.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoMultiProvider.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoNfc.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoPicker.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoPlatform.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoProvider.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoQiita.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoScreen.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSegmentedControl.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSettings.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoShare.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSharedPreferences.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSignInButton.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSlider.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSnackBar.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSqliteViewer.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoSwitch.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoTabBar.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoTextField.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoTimerPicker.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoTwitter.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoWebView.dart';
import 'package:flutter_my_app/pages/Gallery/CupertinoNavigationBar.dart';
import 'package:flutter_my_app/pages/Gallery/CupertinoSegmentedControlDemo.dart';
import 'package:flutter_my_app/pages/Material/AlertDialog.dart';
import 'package:flutter_my_app/pages/Material/BottomSheet.dart';
import 'package:flutter_my_app/pages/Material/Card.dart';
import 'package:flutter_my_app/pages/Material/Checkbox.dart';
import 'package:flutter_my_app/pages/Material/Container.dart';
import 'package:flutter_my_app/pages/Material/CounterScreen.dart';
import 'package:flutter_my_app/pages/Material/DatePicker.dart';
import 'package:flutter_my_app/pages/Material/Drawer.dart';
import 'package:flutter_my_app/pages/Material/FileRWScreen.dart';
import 'package:flutter_my_app/pages/Material/FlatButton.dart';
import 'package:flutter_my_app/pages/Material/FloatingActionButton.dart';
import 'package:flutter_my_app/pages/Material/HelloWorld.dart';
import 'package:flutter_my_app/pages/Cupertino/CupertinoHelloWorld.dart';
import 'package:flutter_my_app/pages/Material/FlutterIssuesScreen.dart';
import 'package:flutter_my_app/pages/Material/HomeMaterial.dart';
import 'package:flutter_my_app/pages/Material/LastDayListView.dart';
import 'package:flutter_my_app/pages/Material/LayoutScreen.dart';
import 'package:flutter_my_app/pages/Material/ListView2Screen.dart';
import 'package:flutter_my_app/pages/Material/ListViewScreen.dart';
import 'package:flutter_my_app/pages/Material/LoremPicsumScreen.dart';
import 'package:flutter_my_app/pages/Material/Navigator.dart';
import 'package:flutter_my_app/pages/Material/Navigator2.dart';
import 'package:flutter_my_app/pages/Material/OutlineButton.dart';
import 'package:flutter_my_app/pages/Material/ProviderScreen.dart';
import 'package:flutter_my_app/pages/Material/Qiita.dart';
import 'package:flutter_my_app/pages/Material/RadioListTile.dart';
import 'package:flutter_my_app/pages/Material/RaisedButton.dart';
import 'package:flutter_my_app/pages/Material/Row.dart';
import 'package:flutter_my_app/pages/Material/SettingScreen.dart';
import 'package:flutter_my_app/pages/Material/Slider.dart';
import 'package:flutter_my_app/pages/Material/SqliteViewer.dart';
import 'package:flutter_my_app/pages/Material/Stack.dart';
import 'package:flutter_my_app/pages/Material/SwitchListTile.dart';
import 'package:flutter_my_app/pages/Material/TextField.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      // theme: ThemeData(
      //  // This is the theme of your application.
      //  primarySwatch: Colors.blue,
      //  backgroundColor: CupertinoColors.black,
      //  scaffoldBackgroundColor: CupertinoColors.black,
      //  dialogBackgroundColor: CupertinoColors.black,
      // ),
      theme: ThemeData.dark(),
      // theme: ThemeData.light(),
      // debugShowCheckedModeBanner: false,

      // initialRoute: '/home',
      // initialRoute: '/cupertinoMenu',
      // initialRoute: '/helloWorld',
      // initialRoute: '/cupertinoQiita',

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
        '/cupertinoMultiProvider': (context) => CupertinoMultiProvider(),
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
        '/cupertinoActivityIndicator': (context) =>
            MyCupertinoActivityIndicator(),
        '/cupertinoBuildingLayouts': (context) => CupertinoBuildingLayouts(),
        '/cupertinoGridView': (context) => MyCupertinoGridView(),
        '/cupertinoPicker': (context) => MyCupertinoPicker(),
        '/cupertinoSegmentedControl': (context) =>
            MyCupertinoSegmentedControl(),
        '/cupertinoSwitch': (context) => MyCupertinoSwitch(),
        '/cupertinoTabBar': (context) => MyCupertinoTabBar(),
        '/cupertinoWebView': (context) => MyCupertinoWebView(),
        '/cupertinoSegmentedControlDemo': (context) =>
            CupertinoSegmentedControlDemo(),
        '/cupertinoNavigationBarDemo': (context) =>
            CupertinoNavigationBarDemo(),
        '/cupertinoTimerPicker': (context) => MyCupertinoTimerPicker(),
        '/cupertinoLocalAuthentication': (context) =>
            CupertinoLocalAuthentication(),
        '/cupertinoCamera': (context) => CupertinoCamera(),
        '/cupertinoBarcodeReader': (context) => CupertinoBarcodeReader(),
        '/cupertinoSignInButton': (context) => CupertinoSignInButton(),
        // '/cupertinoButton2': (context) => MyCupertinoButton2(),
        '/lastDayListView': (context) => LastDayListView(),
        '/sqliteViewer': (context) => SqliteViewer(),
        '/cupertinoSqliteViewer': (context) => CupertinoSqliteViewer(),
        '/cupertinoLocalFile': (context) => CupertinoLocalFile(),
        '/cupertinoSnackBar': (context) => CupertinoSnackBar(),
        '/cupertinoSharedPreferences': (context) =>
            CupertinoSharedPreferences(),
        '/cupertinoDynamicTheme': (context) => MyCupertinoDynamicTheme(),
        '/cupertinoDarkModeFlag': (context) => CupertinoDarkModeFlag(),
        '/cupertinoAdvent': (context) => CupertinoAdventCalender2(),
        '/cupertinoShare': (context) => CupertinoShare(),
        '/cupertinoMenuListView': (context) => CupertinoMenuListView(),
        '/cupertinoCovid19Issues': (context) => CupertinoCovid19Issues(),
        '/cupertinoMonitoringScroll': (context) => CupertinoMonitoringScroll(),
        '/cupertinoNfc': (context) => CupertinoNfc(),
      },
      // home: MyHomeMaterial(title: 'main'),  //BottomNavigationBar

      home: CupertinoMenu(), //CupertinoMenu (no BottomBar)
      // home: CupertinoHome(),                     //CupertinoTabBar (Bottom)

      // home: Provider<LastDayBloc>(
      //   create: (context) => new LastDayBloc(),
      //   dispose: (context, bloc) => bloc.dispose(),
      //   child: LastDayListView(),
      //   // child: CupertinoMenu(),
      // ),
    );
  }
}
