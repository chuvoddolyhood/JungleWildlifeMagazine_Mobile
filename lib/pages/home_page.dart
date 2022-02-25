import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/widgets/bottom_nav_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('content'),
          BottomNavigator_Widget(),
        ],
      ),
    );
  }
}
