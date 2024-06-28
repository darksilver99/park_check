import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

List<BoxShadow> shadowList = [BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))];

class SkeletonView extends StatelessWidget {
  final int index;

  const SkeletonView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
        shimmerColor: Colors.grey,
        shimmerDuration: 1000+((index+1)*10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            boxShadow: shadowList,
          ),
        ));
  }
}
