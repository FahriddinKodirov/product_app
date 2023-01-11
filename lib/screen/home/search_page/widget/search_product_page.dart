import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.35,
      width: width(context) * 0.46,
      decoration: BoxDecoration(
          color:const Color(0xFFDEE6E3).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Column(children: [
            SvgPicture.asset(
              MyIcons.apple,
              width: 160,
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: height(context) * 0.02, top: height(context) * 0.006),
                child: const Text(
                  'Mango',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: height(context) * 0.02),
                child: Text(
                  '\$ 12.2/kg',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0XFF2EC158).withOpacity(0.8),
                  ),
                )),
          ]),
          Positioned(
              top: height(context) * 0.26,
              left: width(context) * 0.29,
              child: SvgPicture.asset(MyIcons.plus, color: Color(0XFF2EC158))),
          Positioned(
              top: height(context) * 0.268,
              left: width(context) * 0.344,
              child: const Text(
                '+',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )),
          Positioned(
              top: height(context) * 0.022,
              left: width(context) * 0.3,
              child: const Icon(
                Icons.favorite_border_rounded,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
