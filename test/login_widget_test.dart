import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silverkakis1/Screens/login_screen.dart';

void main(){
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: const LoginScreen()));
  testWidgets('Sign in page test', (WidgetTester tester) async {
    await tester.pumpWidget(testWidget);

    ///Test for Image
    var logo = find.byType(Image);
    expect(logo, findsWidgets);

    ///Test for Email and Password Fields
    var emailTextField = find.byKey(Key('Email Field'));
    expect(emailTextField, findsOneWidget);
    var passwordTextField = find.byKey(Key('Password Field'));
    expect(passwordTextField, findsOneWidget);

    ///Test for Log In Button
    var button = find.byType(InkWell);
    expect(button, findsOneWidget);

    ///Test for Sign Up Link
    var SignUpLink = find.byType(GestureDetector);
    expect(SignUpLink, findsWidgets);
  });
}