/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:silverkakis1/services/auth_methods.dart';*/


/*import 'package:flutter_test/flutter_test.dart';

class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth{
  @override
  Stream<User> getUserDetails(){
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

void main(){
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final AuthMethods authMethods = AuthMethods(authMethods: mockFirebaseAuth);
  setUp(() {});
  tearDown(() {});
  
  test("emit occurs", () async {
    expectLater(authMethods.getUserDetails(), emitsInOrder([_mockUser]));
  });

  /*test("create account", () async {
  when(
    mockFirebaseAuth.createUserWithEmailAndPassword(
        email: "test123@gmail.com", password: "test123"),
  ).thenAnswer((realInvocation) => null);
  expect(
      await authMethods.signUpUser(email: "test123@gmail.com", password: "test123", bio: "bio"),
      "Success");
  });*/
}

*/

//to do: make the unit test for sign in and sign up

/*void main(){
  test('title', (){
    // setup

    // run

    // verify
  });
  test('empty email returns error string', () {
    var result = Login
  }
}*/
