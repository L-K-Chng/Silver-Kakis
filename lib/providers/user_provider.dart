import 'package:flutter/widgets.dart';
import '../models/user.dart';
import '../services/auth_methods.dart';

/// This class retrieves and store user information when the user logs in.
class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  /// refresh the User if there is a change and notify all components which
  /// uses the _user.
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}