import 'package:flutter/material.dart';
import 'package:products_app/utils/my_utils.dart';

class WidgetIndicator extends StatelessWidget {
  final int newPageIndex;
  const WidgetIndicator({super.key, required this.newPageIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
             height: height(context)*0.007,
             width: MyIndicator.indexOne[newPageIndex],
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: newPageIndex == 0?const Color(0xFF4CBB5E):const Color(0xFFA5DDAF)
             ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
             height: height(context)*0.007,
             width: MyIndicator.indexTwo[newPageIndex],
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: newPageIndex == 1?const Color(0xFF4CBB5E):const Color(0xFFA5DDAF)
             ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
             height: height(context)*0.007,
             width: MyIndicator.indexThree[newPageIndex],
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: newPageIndex == 2?const Color(0xFF4CBB5E):const Color(0xFFA5DDAF)
             ),
          ),
        ),
      ],
    );
  }
}