import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/widgets/actionBar_widget.dart';

class InforTab extends StatelessWidget {
  const InforTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ActionBar_Widget(hasBack: false, titleTab: 'About us'),
      Center(child: Text('Infor Tab')),
    ]);
  }
}
