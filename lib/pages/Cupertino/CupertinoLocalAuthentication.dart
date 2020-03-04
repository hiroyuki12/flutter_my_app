import 'package:flutter/cupertino.dart';
import 'DarkModeColor.dart';
import 'package:local_auth/local_auth.dart';

class CupertinoLocalAuthentication extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoLocalAuthentication> {
  LocalAuthentication _localAuth = LocalAuthentication();

  List<BiometricType> availableBiometricType;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino　LocalAuthentication", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text("Auth"),
          onPressed: () => _authenticate(),
      ),
      ),
    );
  }

  /// 生体認証可能なタイプを取得
  Future<List<BiometricType>> _getAvailableBiometricTypes() async {
    List<BiometricType> availableBiometricTypes;
    // try {
      availableBiometricTypes = await _localAuth.getAvailableBiometrics();
    // } on PlatformException catch (e) {
    //   // TODO
    // }
    return availableBiometricTypes;
  }

  /// 生体認証実行
  Future<bool> _authenticate() async {
    bool result = false;

    List<BiometricType> availableBiometricTypes = await _getAvailableBiometricTypes();

    // try {
      if (availableBiometricTypes.contains(BiometricType.face) || availableBiometricTypes.contains(BiometricType.fingerprint)) {
        result = await _localAuth.authenticateWithBiometrics(localizedReason: "認証してください");
      }
    // } on PlatformException catch (e) {
    //   // TODO
    // }
    return result;
  }

  /// 生体認証可能かどうか
  Future<bool> canCheckBiometrics() async {
    return await _localAuth.canCheckBiometrics;
  }
  
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}
