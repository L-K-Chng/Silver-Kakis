import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:silverkakis1/reusable_widgets/reusable_widget.dart';
import 'package:silverkakis1/screens/chat_page.dart';
import 'package:silverkakis1/screens/interest_group_page.dart';
import 'package:silverkakis1/screens/sign_in_screen.dart';
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
  /*static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
        'Index 1: Business',
      style: optionStyle,
    ),
    Text(
        'Index 2: School',
      style: optionStyle,
    ),
  ];*/

  //linking to other pages
  final _pageOptions = [
    SocialMediaPage(),
    InterestGroupPage(),
    ChatFunctionPage()
  ];

  //for now comment out
  /*void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }*/
  
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
                      MaterialPageRoute(builder: (context) => SignInScreen()));
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
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.groups, size: 30), label: 'Interest Groups'),
            BottomNavigationBarItem(icon: Icon(Icons.sms_rounded, size: 30), label: 'Chat'),
          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        )


        //original code below
        //bottomNavigationBar: const CustomBottomNavigationBar()


        /*BottomNavigationBar(
          backgroundColor: Colors.lightBlueAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
              label: 'School',
            ),
          ],

          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,

          //testing to make navbar linked to other screens

          /*selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },*/

        ),*/
      );
    //);
  }}

