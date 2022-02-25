import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/pages/home_page.dart';
import 'package:junglewildlifemagazine_mobile/values/textStyle.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        //if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: AppStyle.regularText,
            )),
          );
        }
        //Connection successful
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: HomePage(),
          );
        }
        return Scaffold(
          body: Center(
            child: Text(
              'Loading...',
              style: AppStyle.regularText,
            ),
          ),
        );
      },
    );
  }
}
