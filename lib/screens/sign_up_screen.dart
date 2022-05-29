import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:silverkakis1/reusable_widgets/reusable_widget.dart';
import 'package:silverkakis1/screens/home_screen.dart';
import 'package:silverkakis1/utils/colours.dart';

/*class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Sign Up.');
  }
}*/

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //leading: Icon(Icons.arrow_back,
        //color: Colors.black,
        //),
        //can try putting the button and text within the column widget to change the icon from white to black.
        backgroundColor: Colors.transparent,
        elevation: 0, //original 0
        title: const Text(
          "Sign up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          //hexStringToColor("73DEE6"),
          //hexStringToColor("F0E420"),
          //hexStringToColor("23AE22")
          hexStringToColor("ADD8E6"),
          hexStringToColor("ADD8E6"),
          // hexStringToColor("A7BEAE")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 90,
            ),
            reusableTextField("Email Address", Icons.person_outline, false,
                _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Password", Icons.lock_outline, true, _passwordTextController),
            const SizedBox(
              height: 20,
            ),
            /*ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text).then((value) =>
                {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()))
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Sign Up'),
            ),*/
            /*ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Sign Up'),
            ),*/
            firebaseUIButton(context, "Sign Up", (){
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text).then((value) {
                    print("Created New Account");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            })
          ],
        ),
      ),
    );
  }
}
