import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> testing = FirebaseFirestore.instance
      .collection('junglewildlifemagazine')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        onPressed: () {
          // FirebaseFirestore.instance
          //     .collection('junglewildlifemagazine')
          //     .add({'bo': 'okay', 'chi': 'abc'});
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: Text('data'),
    );
  }
}
