import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_methods.dart';
import './login_screen.dart';
import '../providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                userProvider.getUser.username,
              ),
              centerTitle: false,
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    await AuthMethods().signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  tooltip: 'Log Out',
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      userProvider.getUser.photoUrl,
                    ),
                    radius: 80,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.5),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        const Text('Username: '),
                        Text(
                          userProvider.getUser.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        const Text('Email: '),
                        Text(
                          userProvider.getUser.email,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        const Text('Bio: '),
                        Text(
                          userProvider.getUser.bio,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Container(),
                  ),
                ],
              ),
            ),
          );
  }
}
