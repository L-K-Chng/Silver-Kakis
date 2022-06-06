import 'package:flutter/material.dart';

class ChatFunctionPage extends StatefulWidget {
  const ChatFunctionPage({Key? key}) : super(key: key);

  @override
  State<ChatFunctionPage> createState() => _ChatFunctionPageState();
}

class _ChatFunctionPageState extends State<ChatFunctionPage> {
  @override
  Widget build(BuildContext context) {
    return Text('Chat Page!',
    style: TextStyle(fontSize: 50),
    );
  }
}
