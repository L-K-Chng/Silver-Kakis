//import 'dart:js';
import 'package:flutter/material.dart';
//import 'package:silverkakis1/screens/sign_up_screen.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    //width: 200,
    //height: 240,
    width: 240,
    height: 240,
    //color: Colors.black,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    //cursorColor: Colors.white,
    cursorColor: Colors.black,
    //style: TextStyle(color: Colors.white.withOpacity(0.9)),
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        //color: Colors.white70,
        color: Colors.black87,
      ),
      labelText: text,
      //labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      labelStyle: TextStyle(color: Colors.black),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90.0), //orginal is 30.0
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    /*width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),*/
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red;
            }
            return Colors.red;
          }),
      ),
          /*shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),*/
    ),
  );
}

/*Row signUpOption(){
  return  Row(
    children: [
      const Text("Don't have an account?",
      style: TextStyle(color: Colors.black)),
      GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}*/

/*Container signInSignUpButton(

)*/
