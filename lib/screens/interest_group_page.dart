import 'package:flutter/material.dart';
import 'package:silverkakis1/reusable_widgets/plus_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class InterestGroupPage extends StatefulWidget {
  const InterestGroupPage({Key? key}) : super(key: key);

  @override
  State<InterestGroupPage> createState() => _InterestGroupPageState();
}

class _InterestGroupPageState extends State<InterestGroupPage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection('interest groups')
            .where("searchKeywords", arrayContains: name)
            .snapshots()
            : FirebaseFirestore.instance.collection("interest groups").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return Container(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(data['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      leading: CircleAvatar(
                        child: Image.network(
                          data['image'],
                          width: 100,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        radius: 40,
                        backgroundColor: Colors.white70,
                      ),
                      trailing: PlusButton(),
                    ),
                    Divider(
                      thickness: 2,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


