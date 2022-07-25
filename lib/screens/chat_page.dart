import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatFunctionPage extends StatefulWidget {
  const ChatFunctionPage({Key? key}) : super(key: key);

  @override
  State<ChatFunctionPage> createState() => _ChatFunctionPageState();
}

class _ChatFunctionPageState extends State<ChatFunctionPage> {
  @override
  Widget build(BuildContext context) {
    return Text('Chat Page.');
    /*Scaffold(
      body: FutureBuilder(future: FirebaseFirestore.instance.collection('posts').get(),
        builder: (context,snapshot){

        },
      ),
    )*/
  }
}

