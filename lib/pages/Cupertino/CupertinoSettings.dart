import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


var myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

class CupertinoSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSetting", style: myTextStyle),
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
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterStore>(
      builder: (context, counterStore, _) {
        return CupertinoPageScaffold(
          child: Column(
            children: <Widget>[
              CupertinoButton(
                child: Text('Push Flutter Issues'),
                onPressed: ()=> Navigator.pushNamed(context, '/flutterIssues'),
              ),
              CupertinoButton(
                child: Text('Count up'),
                onPressed: counterStore.incrementCounter,
              ),
              Text('Tap count ${counterStore.count}', style: myTextStyle),
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
    // if (Theme.of(context).platform == TargetPlatform.android) {
    // }
    // else
    //{
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
    //}

    return;
  }
}
