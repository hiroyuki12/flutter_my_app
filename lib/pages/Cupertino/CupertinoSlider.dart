import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

var myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

class MyCupertinoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoSlider", style: myTextStyle),
        backgroundColor: const Color(0xff333333),
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
          child: Column(
            children: <Widget>[
              CupertinoSlider(
                value: sliderValue,
                onChanged: (val) {
                  sliderValueStore.changeSliderValue(val);
                  //print(val);
                },
              ),
              Text(sliderValue.toString(), style: myTextStyle),
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