import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:silverkakis1/screens/home_screen.dart';
import 'package:silverkakis1/utils/colours.dart';
import '../Screens/loginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: primaryColor,
      ),
        /// this StreamBuilder enables persisting authentication state.
        /// i.e. Don't need log in everytime.
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          /// Active connection, bring to homeScreen.
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomeScreen();
            }
          }

          /// Connection has errors, show error.
          if (snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
          }

          /// Waiting for Connection.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          /// User not authenticated.
          return LoginScreen();
        },
      )
    );
  }
}
