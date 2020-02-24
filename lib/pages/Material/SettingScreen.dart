import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

enum Fruits { Apple, Orange, Grape }

class _State extends State<Setting> {
  bool dark = false;
  int count = 0;
  String _message = 'Tap OK button.';
  //bool _switchActive = false;
  //List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];
  //List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _deviceInfo = '';
  //String _selectedFruit;
  //var _checkBox1 = false;
  //var _checkBox2 = false;
  //String _text = 'Enter something...';
  //var _radVal = Fruits.Apple;
  //String _radValText = "";
  //var _switchValue = true;
  //var _switchTitle = 'Switch Test';
  //var _labelText = 'Select Date';
  //String _labelSimpleDialog = '';
  //String _labelModalBottomSheet = '';
  //String _time = '';

  @override
  void initState() {
    //_dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    //_selectedFruit = _dropDownMenuItems[0].value;
    /*
    Timer.periodic(
      Duration(seconds: 1),
      _onTimer,
    );
    */
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //return MaterialApp(
    //  theme: dark ? ThemeData.dark() : ThemeData.light(),
    //  home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Push Flutter Issues'),
              onTap: () {
                //setState(() => _city = 'Setting');
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/flutterIssues'));
              },
            ),
            ListTile(
              title: Text('Push Qiita'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/qiita'));
              },
            ),
            ListTile(
              title: Text('Push ListView'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/listView'));
              },
            ),
            ListTile(
              title: Text('Push ListView2'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/listView2'));
              },
            ),
            ListTile(
              title: Text('Push Layout'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/layout'));
              },
            ),
            ListTile(
              title: Text('Push Navigator'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/navigator'));
              },
            ),
            ListTile(
              title: Text('Push Navigator2'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/navigator2'));
              },
            ),
            ListTile(
              title: Text('Push HelloWorld'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/helloWorld'));
              },
            ),
            ListTile(
              title: Text('Push Provider'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/provider'));
              },
            ),
            ListTile(
              title: Text('Push Counter'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/counter'));
              },
            ),
            ListTile(
              title: Text('Push AlertDialog'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/alertDialog'));
              },
            ),
            ListTile(
              title: Text('Push BottomSheet'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/bottomSheet'));
              },
            ),
            ListTile(
              title: Text('Push Card'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/card'));
              },
            ),
            ListTile(
              title: Text('Push Checkbox'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/checkbox'));
              },
            ),
            ListTile(
              title: Text('Push Container'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/container'));
              },
            ),
            ListTile(
              title: Text('Push DatePicker'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/datePicker'));
              },
            ),
            ListTile(
              title: Text('Push Drawer'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/drawer'));
              },
            ),
            ListTile(
              title: Text('Push FloatingActionButton'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/floatingActionButton'));
              },
            ),
            ListTile(
              title: Text('Push Lorem Picsum'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/loremPicsum'));
              },
            ),
            ListTile(
              title: Text('Push RadioListTile'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/radioListTile'));
              },
            ),
            ListTile(
              title: Text('Push Row'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/row'));
              },
            ),
            ListTile(
              title: Text('Push Slider'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/slider'));
              },
            ),
            ListTile(
              title: Text('Push Stack'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/stack'));
              },
            ),
            ListTile(
              title: Text('Push SwitchListTile'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/switchListTile'));
              },
            ),
            ListTile(
              title: Text('Push TextField'),
              onTap: () {
                Navigator.pop(context);
                setState(() => Navigator.pushNamed(context, '/textField'));
              },
            ),
          ],
        ),
      ),
        body: Container(
          color:  Colors.white10,
          //padding: EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              /*
              //スイッチ
              Switch(
                value: _switchActive,
                // activeColor: Colors.orange,
                // activeTrackColor: Colors.red,
                // inactiveThumbColor: Colors.blue,
                // inactiveTrackColor: Colors.green,
                onChanged: _changeSwitch,
              ),
              */
              /*
              //スイッチでダークテーマトグル(iPhoneっぽく)
              //Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              //  children<Widget>[
                  Text('Dark Theme', style: TextStyle(fontSize: 16.0),),
                  CupertinoSwitch(
                    value: _switchActive,
                    // activeColor: Colors.orange,
                    // activeTrackColor: Colors.red,
                    // inactiveThumbColor: Colors.blue,
                    // inactiveTrackColor: Colors.green,
                    onChanged: _changeSwitch,
                  ),
                //]
              //),
              */
              //ボタン(iPhoneっぽく)
              CupertinoButton(
                child: Text('Push Flutter Issues'),
                onPressed: ()=> Navigator.pushNamed(context, '/flutterIssues'),
                //onPressed: _onPushFlutterIssuesPressed,
              ),

              //ボタン(iPhoneっぽく)
              CupertinoButton(
                child: Text('OK'),
                onPressed: _onOKPressed,
              ),
              Text(_message),
              /*
              //ボタン画面遷移(iPhoneっぽく)
              CupertinoButton(
                  child: Text('Flutter Issues(Navigator.pop)'),
                  //onPressed: () => Navigator.pushNamed(context, '/home'),
                  onPressed: () => Navigator.pop(context),
              ),           
              */
              /*
              //シンプルダイアログ
              RaisedButton(
                child: Text('Please select'),
                onPressed: _showSimpleDialog,
              ),
              Text(_labelSimpleDialog),
              */
              /*
              //プログレスインジケーター Indeterminate
              LinearProgressIndicator(),
              CircularProgressIndicator(),
              */
              /*
              //タイマー 時間表示
              Text(
                _time,
                style: TextStyle(
                  fontSize: 60.0,
                  fontFamily: 'IBMPlexMono',
                ),
              ),
              */
              /*
              //ドロップダウンリスト
              Text("Please choose a fruit: "),
              DropdownButton(
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),
              */
              //ボタン device_info
              CupertinoButton(
                onPressed: () => _showDeviceInfo(context),
                child: Text('device_info'),
              ),
              Text(_deviceInfo),
              
            ],
          ),
        ),
      //),
    );
  }

  //OKボタン押下時
  void _onOKPressed() {
    setState(() {
      ++count;
      _message = 'Tap count $count';
    });
  }


/*
  //スイッチ変更時
  void _changeSwitch(bool newValue) {
    setState(() {
      _switchActive = newValue;
    });
    applyThemeDate(_switchActive);
  }
*/


/*
  Future _showSimpleDialog() async {
    String result = "";
    result = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select account'),
          children: <Widget>[
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.shade200,
                  child: Text(
                    'U1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text('user1@keicode.com'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  "user1",
                );
              },
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  child: Text(
                    'U2',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text('user2@gmail.com'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  "user2",
                );
              },
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                title: Text('Add account'),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  "Add account",
                );
              },
            ),
          ],
        );
      },
    );
    _setLabel(result);
  }
*/
/*
  //シンプルダイアログ
  void _setLabel(String s) {
    if (s == null) {
      return;
    }
    setState(() => _labelSimpleDialog = s);
  }
*/
/*
  //タイマー
  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm:ss');
    var formattedTime = formatter.format(now);
    setState(() => _time = formattedTime);
  }
*/

  //ドロップダウンリスト
  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

/*
  //ドロップダウンリスト
  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }
*/
  //スイッチでダークテーマトグル
  void applyThemeDate(bool darkTheme){
    if(darkTheme==true){
      setState(() {
        dark = true;
      });
    }else{
      setState(() {
        dark = false;
      });
    }
  }

  //Device Info
  _showDeviceInfo(BuildContext context) {
    setState(() {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      if (Theme.of(context).platform == TargetPlatform.android) {
      }
      else
      {
        deviceInfo.iosInfo.then((IosDeviceInfo info){
          print("name=${info.name}"); // ko2ic の iPhone
          _deviceInfo = "name=${info.name}";
          print("systemName=${info.systemName}"); // iOS
          print("systemVersion=${info.systemVersion}"); // 12.1
          print("model=${info.model}"); // iPhone
          print("localizedModel=${info.localizedModel}"); // iPhone
          print("identifierForVendor=${info.identifierForVendor}"); // D644A484-CE48-47EE-8A2F-30488E0D71E1
          print("isPhysicalDevice=${info.isPhysicalDevice}"); // false
          print("sysname=${info.utsname.sysname}"); // Darwin
          print("nodename=${info.utsname.nodename}"); // ko2ic-no-iPhone
          print("release=${info.utsname.release}"); // 18.2.0
          print("version=${info.utsname.version}"); // Darwin Kernel Version 18.2.0: Mon Nov 12 20:24:46 PST 2018; root:xnu-4903.231.4~2/RELEASE_X86_64
          print("machine=${info.utsname.machine}"); // x86_64
        });
      }
    });
  }
}