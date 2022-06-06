import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silverkakis1/screens/home_screen.dart';
import 'package:silverkakis1/screens/sign_up_screen.dart';
import 'package:silverkakis1/utils/colours.dart';
import 'package:silverkakis1/reusable_widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  //hexStringToColor("73DEE6"),
                  //hexStringToColor("F0E420"),
                  //hexStringToColor("23AE22")
                  hexStringToColor("ADD8E6"),
                  hexStringToColor("ADD8E6"),
                  // hexStringToColor("A7BEAE")
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter
                )),
            child: SingleChildScrollView(
              child: Padding(
                //padding: EdgeInsets.only(top: 100.0),
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery
                    .of(context)
                    .size
                    .height * 0.1, 20, 0),
                // original is 0.2, 20, 0
                child: Column(children: <Widget>[
                  logoWidget("assets/images/silverkakis.png"),
                  //add text under picture.
                  const SizedBox(
                    height: 0,
                  ),
                  Padding(padding: EdgeInsets.only(bottom:10.0),
                  child: Text('Silver Kakis',
                  style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  ),),),
                  /*Text(
                    'Silver Kakis',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),*/
                  const SizedBox(height: 10),
                  reusableTextField("Email Address", Icons.person_outline,
                      false, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  /*ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    },
                    child: Text('Sign in'),
                  ),*/
                  firebaseUIButton(context, "Sign In", () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text).then((value) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  signUpOption(),
                  //Nav(),
                ]),
              ),
            )));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}






