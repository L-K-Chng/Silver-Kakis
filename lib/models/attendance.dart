import 'package:cloud_firestore/cloud_firestore.dart';

class Attendance {
  final String uid;
  final String username;
  final DateTime dateTime;
  final String mood;
  final String profImage;

  const Attendance(
      {
        required this.uid,
        required this.username,
        required this.dateTime,
        required this.mood,
        required this.profImage,
      });

  static Attendance fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Attendance(
        uid: snapshot["uid"],
        username: snapshot["username"],
        dateTime: snapshot['dateTime'],
        mood: snapshot['mood'],
        profImage: snapshot['profImage'],
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "dateTime": dateTime,
    "mood": mood,
    'profImage': profImage,
  };
}