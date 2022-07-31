import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silverkakis1/screens/social_feed_screen.dart';

void main() async{
  Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: FeedScreen()));
  testWidgets('Social Feed Page Widget Test', (WidgetTester tester) async{
    await tester.pumpWidget(testWidget);

    ///Test for Silver Kakis Header
    var header =  find.byType(Image);
    expect(header, findsWidgets);

    ///Test for Back Button
    var signOutButton = find.byKey(Key('Sign Out Button'));
    expect(signOutButton, findsOneWidget);
  });
}

