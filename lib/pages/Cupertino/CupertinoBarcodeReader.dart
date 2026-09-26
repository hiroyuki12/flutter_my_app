import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'DarkModeColor.dart';


class CupertinoBarcodeReader extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoBarcodeReader> {
  String barcode = '';
  List<CameraDescription> _cameras = [];   //カメラリスト
  CameraController? _controller;       //カメラコントローラ

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future barcodeScanning() async {
    try {
      // barcode_scan の BarcodeScanner.scan() 相当: スキャン画面を開き、読み取った値を受け取る
      final String? barcode = await Navigator.push<String>(
        context,
        MaterialPageRoute(builder: (_) => _BarcodeScannerPage()),
      );
      if (barcode == null) {
        throw FormatException();
      }
      setState(() => this.barcode = barcode);
    // } on PlatformException catch (e) {
    //   if (e.code == BarcodeScanner.CameraAccessDenied) {
    //     setState(() {
    //       this.barcode = 'No camera permission!';
    //     });
    //   } else {
    //     setState(() => this.barcode = 'Unknown error: $e');
    //   }
    } on FormatException {
      setState(() => this.barcode = 'Nothing captured.');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
  //
  // カメラを準備
  //
  initCamera() async {
    _cameras = await availableCameras();

    if (_cameras.length != 0) {
      final controller = CameraController(_cameras[0], ResolutionPreset.high);
      _controller = controller;
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        
        setState(() {});  //カメラ接続時にbuildするようsetStateを呼び出し
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino Barcode Reader", style: _buildTextStyle()),
        // trailing: Text("Edit", style: _buildTextStyle()),
      ),
      child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                  child: Text('Scan Barcode', style: _buttonTextStyleNoBackground),
                  onPressed: () {
                    barcodeScanning();
                  }),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Text('Scan Result : $barcode', style: _buildTextStyle()),
            ],
          ),
        ],
      ),
    ),


      /*
      child: _controller != null && _controller!.value.isInitialized
        ? AspectRatio(
          aspectRatio:
          _controller!.value.aspectRatio,
          child: CameraPreview(_controller!)) : Container(),

          */
    );
  }
}

/// 最初に検出したバーコードの値を返して閉じるスキャン画面
class _BarcodeScannerPage extends StatefulWidget {
  @override
  State<_BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<_BarcodeScannerPage> {
  bool _handled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan Barcode')),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          final String? value =
              capture.barcodes.isEmpty ? null : capture.barcodes.first.rawValue;
          if (_handled || value == null) {
            return;
          }
          _handled = true;
          Navigator.pop(context, value);
        },
      ),
    );
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

TextStyle _buttonTextStyleNoBackground = new TextStyle(
  fontWeight: FontWeight.w300,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: CupertinoColors.activeBlue,  //black , darkMode=white
);