import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silverkakis1/screens/add_data_screen.dart';
import 'package:silverkakis1/screens/home_screen.dart';
import './providers/user_provider.dart';
import './Screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// Providers for the App (Producers)
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Silver Kakis',
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
          ),

          /// this StreamBuilder enables persisting authentication state.
          /// i.e. Don't need log in everytime.
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              /// Active connection, bring to homeScreen.
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const AddData(homeScreen: HomeScreen(),);
                }
              }

              /// Connection has errors, show error.
              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }

              /// Waiting for Connection.
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }

              /// User not authenticated.
              return const LoginScreen();
            },
          )),
    );
  }
}
