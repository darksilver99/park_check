import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
];

class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SkeletonAnimation(
          shimmerColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          shimmerDuration: 1000,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
              boxShadow: shadowList,
            ),
            margin: EdgeInsets.only(top: 40),
          )),
    );
  }
}
