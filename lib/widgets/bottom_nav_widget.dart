import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigator_Widget extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  const BottomNavigator_Widget(
      {Key? key, required this.selectedTab, required this.tabPressed})
      : super(key: key);

  @override
  State<BottomNavigator_Widget> createState() => _BottomNavigator_WidgetState();
}

class _BottomNavigator_WidgetState extends State<BottomNavigator_Widget> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    selectTab = widget.selectedTab;
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: displayWidth * 0.03),
      // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 10.0, spreadRadius: 1.0)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonNav_Widget(
            titleIcon: 'home',
            isSelected: (selectTab == 0 ? true : false),
            onTap_: () {
              widget.tabPressed(0);
            },
          ),
          ButtonNav_Widget(
            titleIcon: 'search',
            isSelected: (selectTab == 1 ? true : false),
            onTap_: () {
              widget.tabPressed(1);
            },
          ),
          ButtonNav_Widget(
            titleIcon: 'about',
            isSelected: (selectTab == 2 ? true : false),
            onTap_: () {
              widget.tabPressed(2);
            },
          ),
        ],
      ),
    );
  }
}

class ButtonNav_Widget extends StatelessWidget {
  final String titleIcon;
  final bool isSelected;
  final VoidCallback onTap_;
  const ButtonNav_Widget(
      {Key? key,
      required this.titleIcon,
      required this.isSelected,
      required this.onTap_})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (titleIcon == 'home') {
      return Container(
        child: InkWell(
          onTap: onTap_,
          child: Icon(
            Icons.home_outlined,
            size: 30,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      );
    } else if (titleIcon == 'search') {
      return Container(
        child: InkWell(
          onTap: onTap_,
          child: Icon(
            Icons.search,
            size: 30,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      );
    } else if (titleIcon == 'about') {
      return Container(
        child: InkWell(
          onTap: onTap_,
          child: Icon(
            Icons.info_outlined,
            size: 30,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      );
    }
    return CircularProgressIndicator();
  }
}
