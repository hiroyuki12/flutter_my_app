import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'DarkModeColor.dart';

class MyCupertinoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("CupertinoSlider", style: _buildTextStyle()),
      ),
      child: ChangeNotifierProvider(
        create: (context) => SliderValueStore(),
        child: MyCupertinoSlider2(),
      ),
    );
  }
}

double sliderValue=0;

class MyCupertinoSlider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SliderValueStore>(
      builder: (context, sliderValueStore, _) {
        return CupertinoPageScaffold(
          backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
          child: Column(
            children: <Widget>[
              CupertinoSlider(
                value: sliderValue,
                onChanged: (val) {
                  sliderValueStore.changeSliderValue(val);
                  //print(val);
                },
                min: 0,
                max: 100,
                divisions: 100,
              ),
              Text(sliderValue.toString(), style: _buildTextStyle()),
            ],
          ),
        );
      }
    );
  }
}

class SliderValueStore with ChangeNotifier {
  void changeSliderValue(double val)  {
    sliderValue = val;
    notifyListeners();
  }
}

var myTextStyle = new TextStyle();
TextStyle _buildTextStyle() {
  return myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  // color: CupertinoColors.white
  color: isDarkMode ? darkModeForeColor : foreColor,  //black , darkMode=white
  );
}