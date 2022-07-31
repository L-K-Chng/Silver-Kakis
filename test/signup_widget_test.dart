import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:silverkakis1/screens/sign_up_screen.dart';

String email = 'test123@gmail.com', password = 'test123', username = 'test123', bio = 'bio',
    file = 'https://i.stack.imgur.com/l60Hf.png';

Widget makeTestableWidget() => new MediaQuery(
    data: new MediaQueryData(),
    child: new MaterialApp(home: SignupScreen()));

void main() async {
  testWidgets('Sign Up Page', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));

    ///Test for username, email, password and bio
    var usernameField = find.byKey(Key('Username Field'));
    expect(usernameField, findsOneWidget);
    var emailTextField = find.byKey(Key('Email Field'));
    expect(emailTextField, findsOneWidget);
    var passwordTextField = find.byKey(Key('Password Field'));
    expect(passwordTextField, findsOneWidget);
    var bioField = find.byKey(Key('Bio Field'));
    expect(bioField, findsOneWidget);

    ///Test for Sign Up Button
    var button = find.byType(InkWell);
    expect(button, findsOneWidget);

    ///Test for Log In Link
    var LogInLink = find.byType(GestureDetector);
    expect(LogInLink, findsWidgets);
  });
}