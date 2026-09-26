import 'package:flutter/cupertino.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'DarkModeColor.dart';

class CupertinoSignInButton extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CupertinoSignInButton> {
  @override
  Widget build(BuildContext context) {
    isDarkMode = true;  // switch darkMode
    return CupertinoPageScaffold(
      backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDarkMode ? darkModeBackColor : backColor,  //white , darkMode=black
        middle: Text("Cupertino Signin Button", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            // SignInButton(
            //   Buttons.google,
            //   text: "Sign up with Google",  // with custom text
            //   onPressed: () {},
            // SignInButtonBuilder(
            //   text: 'Get going with Email',
            //   icon: Icons.email,
            //   onPressed: () {},
            //   backgroundColor: Colors.blueGrey[700],
            //   width: 200.0,
            // ),
            // Divider(),
            SignInButton(
              Buttons.google,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.gitHub,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.twitter,
              text: "Use Twitter",
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.apple,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.facebook,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.pinterest,
              text: "Sign up with Pinterest",
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.email,
              text: "Get going with Email",
              onPressed: () {},
            ),
          ],
        ),
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
