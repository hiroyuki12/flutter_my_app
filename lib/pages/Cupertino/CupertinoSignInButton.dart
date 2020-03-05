import 'package:flutter/cupertino.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
        middle: Text("Cupertino Hello World", style: _buildTextStyle()),
        //trailing: Text("Edit", style: myTextStyle),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            // SignInButton(
            //   Buttons.Google,
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
              Buttons.Google,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.GitHub,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.Twitter,
              text: "Use Twitter",
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.Apple,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.Facebook,
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.Pinterest,
              text: "Sign up with Pinterest",
              onPressed: () {},
            ),
            SizedBox(height: 5,),
            SignInButton(
              Buttons.Email,
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
