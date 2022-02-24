import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'addnote.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "todo app",
      theme: ThemeData(
        primaryColor: Colors.greenAccent[700],
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fb = FirebaseDatabase.instance;
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
        appBar: AppBar(
          title: Text(
            'Todos',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.indigo[900],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: testing,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return Text('Some error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading');
            }
            final data = snapshot.requireData;
            return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  final bo = data.docs[index]['bo'];
                  final chi = data.docs[index]['ho'];
                  return Text('Bo la $bo, Chi la $chi');
                });
          },
        ));
  }
}
