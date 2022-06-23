import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Method to add an image to firebase storage.
  /// Profile pictures are stored with their UID as the file name.
  /// Post pictures are stored within a folder with their UID as the directory name.
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {

    /// Creates a folder (if it does not exist)
    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);

    /// image uploaded is a post
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}