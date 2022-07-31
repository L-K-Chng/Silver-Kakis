import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silverkakis1/screens/profile_page.dart';

void main() {
  testWidgets("Profile Page Test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfilePage()));

    ///Test for Sign out button
    var backbutton = find.byType(IconButton);
    expect(backbutton, findsOneWidget);

    ///Test for username, email and bio
    var username = find.text('Username: ');
    expect(username, findsOneWidget);
    var email = find.text('Email: ');
    expect(email, findsOneWidget);
    var bio = find.text('Bio: ');
    expect(bio, findsOneWidget);
  });
}