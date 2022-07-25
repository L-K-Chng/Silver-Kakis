import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as model;
import './storage_methods.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Retrieves the user credentials.
  Future<model.User> getUserDetails() async {
    //await Firebase.initializeApp();
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  /// Add an user to the firebase authentication and uploads their credentials
  /// onto firestore.
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List file}) async {
    String res = "Some error Occurred";

    try {
      /// Registers users with their email and password
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        /// Uploads the profile picture to firebase storage and add a link
        /// to it in the user cred document within firestore.
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User _user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          interestGroups: [],
        );

        /// Adds user credentials to firestore.
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  /// Methods which authenticates and logs the user in.
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        /// Authenticates using email and password.
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      /// firebase exceptions for authentication
      /// E.g. bad password, bad email.
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
