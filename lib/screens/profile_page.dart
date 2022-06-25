import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signOut() async {
    await _firebaseAuth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _signOut();
            },
            tooltip: 'Log Out',
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
