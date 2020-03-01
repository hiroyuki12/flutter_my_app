import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DarkModeColor.dart';

class CupertinoSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoSetting", style: _buildFont()),
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
          backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
          child: Column(
            children: <Widget>[
              // CupertinoButton(
              //   child: Text('Push Cupertino Flutter Issues'),
              //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoFlutterIssues'),
              // ),
              // CupertinoButton(
              //   child: Text('Push Cupertino Twitter'),
              //   onPressed: ()=> Navigator.pushNamed(context, '/cupertinoTwitter'),
              // ),
              CupertinoButton(
                child: Text('Count up'),
                onPressed: counterStore.incrementCounter,
              ),
              Text('Tap count ${counterStore.count}', style: myTextStyle),
              //AlertDialog
              CupertinoButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("Warning"),
                        content: Text("Are you sure want to delete this data?"),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text("No"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text("Yes"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isDestructiveAction: true,
                          ),
                        ],
                      );
                    }
                  );
                },
                child: Text("Cupertino Alert Dialog",),
                ),
              CupertinoButton(
                child: Text('device_info'),
                onPressed: counterStore.incrementCounter,
              ),
              Text('name=${counterStore.name}', style: myTextStyle),
              Text('systemName=${counterStore.systemName}', style: myTextStyle),
            ],
          ),
        );
      }
    );
  }
}

class CounterStore with ChangeNotifier {
  var count = 0;
  String name = "";
  String systemName = "";

  void incrementCounter()  {
    count++;
    getDeviceInfo();

    notifyListeners();
  }

  void getDeviceInfo() {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    bool isIOS = Platform.isIOS ? true : false;
          
    if (!isIOS) {
    }
    else {
      deviceInfo.iosInfo.then((IosDeviceInfo info){
        //print("name=${info.name}"); // ko2ic の iPhone
        name = "${info.name}";
        //print("systemName=${info.systemName}"); // iOS
        systemName = "${info.systemName}";
        // print("systemVersion=${info.systemVersion}"); // 12.1
        // print("model=${info.model}"); // iPhone
        // print("localizedModel=${info.localizedModel}"); // iPhone
        // print("identifierForVendor=${info.identifierForVendor}"); // D644A484-CE48-47EE-8A2F-30488E0D71E1
        // print("isPhysicalDevice=${info.isPhysicalDevice}"); // false
        // print("sysname=${info.utsname.sysname}"); // Darwin
        // print("nodename=${info.utsname.nodename}"); // ko2ic-no-iPhone
        // print("release=${info.utsname.release}"); // 18.2.0
        // print("version=${info.utsname.version}"); // Darwin Kernel Version 18.2.0: Mon Nov 12 20:24:46 PST 2018; root:xnu-4903.231.4~2/RELEASE_X86_64
        // print("machine=${info.utsname.machine}"); // x86_64
      });
    }

    return;
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