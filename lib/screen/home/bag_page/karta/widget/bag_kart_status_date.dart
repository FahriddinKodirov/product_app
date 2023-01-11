import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_utils.dart';

class BagKartStatusDate extends StatelessWidget {
  final String word;
  final String date;
  final Color myColorBox;
  final Color myColorWord;

  const BagKartStatusDate({
    super.key,
    required this.word,
    required this.date,
    required this.myColorBox,
    required this.myColorWord,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.07),
          child: Container(
            height: height(context) * 0.046,
            width: width(context) * 0.38,
            decoration: BoxDecoration(
                color: myColorBox, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: width(context) * 0.03, top: height(context) * 0.01),
              child: Text(
                word,
                style: TextStyle(color: myColorWord),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.07),
          child: Container(
            height: height(context) * 0.046,
            width: width(context) * 0.38,
            decoration: BoxDecoration(
                color: const Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: width(context) * 0.03, top: width(context) * 0.01),
              child: Text(
                date,
                style: const TextStyle(color: Colors.black26),
              ),
            ),
          ),
        )
      ],
    );
  }
}
