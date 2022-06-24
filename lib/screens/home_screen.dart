import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:silverkakis1/screens/chat_page.dart';
import 'package:silverkakis1/screens/interest_group_page.dart';
import 'package:silverkakis1/screens/loginScreen.dart';
import 'package:silverkakis1/screens/profile_page.dart';
import 'package:silverkakis1/screens/social_media_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  //static const  String _title = 'Flutter Code Sample';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //insertion of bottom nav bar.
  //uncomment the bottom for the original code
  int _selectedIndex = 0;
  //linking to other pages
  final _pageOptions = [
    SocialMediaPage(),
    InterestGroupPage(),
    ChatFunctionPage(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    //return Container(
    return Scaffold(
      //child: Scaffold(
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
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            ),
          ],
        ),
        //this is the entire code for bottom nav bar
        /*body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),*/

        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.groups, size: 30), label: 'Interest'),
            BottomNavigationBarItem(icon: Icon(Icons.sms_rounded, size: 30), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded, size: 30), label: 'Profile'),
          ],
          selectedItemColor: Colors.blue,
          elevation: 5.0,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white70,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        )
      );
  }}

