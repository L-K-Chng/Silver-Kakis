import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silverkakis1/screens/profile_page.dart';

void main() {
  testWidgets("Profile Page Test", (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: ProfilePage()));

    var username = find.text('Username: ');
    expect(username, findsOneWidget);
  });
}