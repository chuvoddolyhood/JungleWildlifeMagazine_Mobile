import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/values/textStyle.dart';

class ActionBar_Widget extends StatelessWidget {
  final bool hasBack;
  final String titleTab;
  const ActionBar_Widget(
      {Key? key, required this.hasBack, required this.titleTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBack) Icon(Icons.arrow_back),
          Text(
            titleTab,
            style: AppStyle.regularText,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/test-f7282.appspot.com/o/logo.PNG?alt=media&token=0e9e0b16-7312-4898-897e-cf525c218371',
              // fit: BoxFit.cover,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
