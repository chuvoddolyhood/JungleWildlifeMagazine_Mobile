import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/widgets/actionBar_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ActionBar_Widget(
          titleTab: 'Home',
          hasBack: false,
        ),
        Center(child: Text('Home Tab')),
      ],
    );
  }
}
