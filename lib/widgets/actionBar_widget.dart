import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/pages/detail.dart';
import 'package:junglewildlifemagazine_mobile/values/textStyle.dart';

class ActionBar_Widget extends StatelessWidget {
  final bool hasBack;
  final String titleTab;
  final bool hasBackground;
  const ActionBar_Widget(
      {Key? key,
      required this.hasBack,
      required this.titleTab,
      required this.hasBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: hasBackground
              ? LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0.0)],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1))
              : null),
      padding: EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (hasBack)
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
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
