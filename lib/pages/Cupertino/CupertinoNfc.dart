import 'package:flutter/cupertino.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';
import 'package:nfc_manager/nfc_manager_ios.dart';
import 'DarkModeColor.dart';

class CupertinoNfc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoNfc> {
  int balance = 0;
  NfcFAndroid? nfcf;
  FeliCaIos? felica;

  @override
  Widget build(BuildContext context) {
    _readTag();

    isDarkMode = true; // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor:
          isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            isDarkMode ? darkModeBackColor : backColor, //white , darkMode=black
        middle: Text("Cupertino NFC", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child: Text(
          "Hello World!",
          style: _buildTextStyle(),
        ),
      ),
    );
  }

  _readTag() {
    NfcManager.instance.startSession(
      pollingOptions: {NfcPollingOption.iso18092},
      onDiscovered: (NfcTag tag) async {
        nfcf = NfcFAndroid.from(tag);
        felica = FeliCaIos.from(tag);
      },
    );

    if (nfcf == null && felica == null) {
      print("効果は無いみたいだ・・・");
    } else {
      print("nfcf ok");
    }
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: isDarkMode ? darkModeForeColor : foreColor, //black , darkMode=white
  );
}
