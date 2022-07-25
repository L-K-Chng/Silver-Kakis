import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silverkakis1/screens/home_screen.dart';
import '../providers/user_provider.dart';
import '../services/firestore_methods.dart';
import '../utils/utils.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({Key? key}) : super(key: key);

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  bool isLoading = false;

  void markAttendance(
      String uid, String username, String profImage, String mood) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods()
          .uploadAttendance(uid, username, profImage, mood);
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Thanks for using the App!',
        );
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "How are you feeling today?",
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 10,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => markAttendance(
                      userProvider.getUser.uid,
                      userProvider.getUser.username,
                      userProvider.getUser.photoUrl,
                      "Good"),
                  icon: const Icon(Icons.tag_faces),
                  label: const Text("Good"),
                ),
                ElevatedButton.icon(
                  onPressed: () => markAttendance(
                      userProvider.getUser.uid,
                      userProvider.getUser.username,
                      userProvider.getUser.photoUrl,
                      "Bad"),
                  icon: const Icon(Icons.thumb_down_alt_outlined),
                  label: const Text("Bad"),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
