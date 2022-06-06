import 'package:flutter/material.dart';

class InterestGroupPage extends StatefulWidget {
  const InterestGroupPage({Key? key}) : super(key: key);

  @override
  State<InterestGroupPage> createState() => _InterestGroupPageState();
}

class _InterestGroupPageState extends State<InterestGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Interest Groups!',
      style: TextStyle(fontSize: 70),
      ),
    );
  }
}
