// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HelloWorld extends StatefulWidget {
//   @override
//     State<StatefulWidget> createState() {
//     return _State();
//   }
// }

// class _State extends State<HelloWorld> {
  
// final emailInputController = new TextEditingController();
// final passwordInputController = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Material HelloWorld!"),
//       ),
//       body: _layoutBody(),
//     );
//   }
  
//   Widget _layoutBody() {
//     return new Center(
//       child: new Form(
//         child: new SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: new Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               const SizedBox(height: 24.0),
//               new TextFormField(
//                 controller: emailInputController,
//                 decoration: const InputDecoration(
//                   border: const UnderlineInputBorder(),
//                   labelText: 'Email',
//                 ),
//               ),
//               const SizedBox(height: 24.0),
//               new TextFormField(
//                 controller: passwordInputController,
//                 decoration: new InputDecoration(
//                   border: const UnderlineInputBorder(),
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 24.0),
//               new Center(
//                 child: new RaisedButton(
//                   child: const Text('Login'),
//                   onPressed: () {
//                     var email = emailInputController.text;
//                     var password = passwordInputController.text;
//                     return _signIn(email, password)
//                         .then((AuthResult result) => print(result.user))
//                         .catchError((e) => print(e));
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<AuthResult> _signIn(String email, String password) async {
//     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//     final AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//     print("User id is ${result.user.uid}");
//     return result;
//   }
// }
