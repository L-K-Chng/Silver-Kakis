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

/*void main(){
  testWidgets("Sign Out Test", (WidgetTester tester) async {
    //find all widgets needed
    final signOutButton = find.byKey(ValueKey("Sign Out Button"));

    //execute the actual test
    await tester.pumpWidget(MaterialApp(home: FeedScreen()));
    await tester.tap(signOutButton);
    await tester.pump();

    //check outputs
    expect(signOutButton, findsOneWidget);

  });
}*/
