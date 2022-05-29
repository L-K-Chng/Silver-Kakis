import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:silverkakis1/screens/sign_in_screen.dart';

/*class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: ElevatedButton(
          child: Text("Log Out"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            });
          },
        ),
      ),
    );
  }
}*/


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Silver Kakis"),
          backgroundColor: Colors.lightBlueAccent,
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton(child: Text("Log Out"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }}

