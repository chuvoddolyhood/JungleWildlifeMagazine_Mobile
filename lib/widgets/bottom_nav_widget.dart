import 'package:flutter/material.dart';

class BottomNavigator_Widget extends StatefulWidget {
  const BottomNavigator_Widget({Key? key}) : super(key: key);

  @override
  State<BottomNavigator_Widget> createState() => _BottomNavigator_WidgetState();
}

class _BottomNavigator_WidgetState extends State<BottomNavigator_Widget> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10.0, spreadRadius: 1.0)
          ],
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonNav_Widget(
            titleIcon: 'home',
            isSelected: (selectTab == 0 ? true : false),
          ),
          ButtonNav_Widget(
            titleIcon: 'search',
            isSelected: (selectTab == 1 ? true : false),
          ),
          ButtonNav_Widget(
            titleIcon: 'about',
            isSelected: (selectTab == 2 ? true : false),
          ),
        ],
      ),
    );
  }
}

class ButtonNav_Widget extends StatelessWidget {
  final String titleIcon;
  final bool isSelected;
  const ButtonNav_Widget(
      {Key? key, required this.titleIcon, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (titleIcon == 'home') {
      return Container(
        child: Icon(
          Icons.home_outlined,
          size: 30,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      );
    } else if (titleIcon == 'search') {
      return Container(
        child: Icon(
          Icons.search,
          size: 30,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      );
    } else if (titleIcon == 'about') {
      return Container(
        child: Icon(
          Icons.info_outlined,
          size: 30,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      );
    }
    return CircularProgressIndicator();
  }
}
