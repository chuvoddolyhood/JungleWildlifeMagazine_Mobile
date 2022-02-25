import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/widgets/bottom_nav_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  late int selectedTabNav = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedTabNav = index;
              });
            },
            children: [
              Container(
                // color: Colors.red,
                child: Center(
                  child: Text('Home Page'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Search Page'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Infor Page'),
                ),
              )
            ],
          )),
          BottomNavigator_Widget(
            selectedTab: selectedTabNav,
            tabPressed: (index) {
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn);
            },
          ),
        ],
      ),
    );
  }
}
