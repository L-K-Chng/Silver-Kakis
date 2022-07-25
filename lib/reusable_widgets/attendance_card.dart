import 'package:flutter/material.dart';
import '../providers/user_provider.dart';
import '../services/firestore_methods.dart';


class AttendanceCard extends StatefulWidget {
  const AttendanceCard({Key? key}) : super(key: key);

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
        children: [
          const Text("How are you feeling today?"),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.tag_faces),
                label: Text("Good"),
              ),
              ElevatedButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.thumb_down_alt_outlined),
                label: Text("Bad"),
              ),
            ],
          )
        ],
      )),
    );
  }
}
