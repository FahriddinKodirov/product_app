import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class AccountHead extends StatelessWidget {
  const AccountHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: height(context) * 0.034, left: width(context) * 0.055),
          child: back(context),
        ),
        Padding(
          padding: EdgeInsets.only(top: height(context) * 0.032,right: width(context) * 0.05),
          child: const Text('Profile'),
        ),
        Padding(
          padding: EdgeInsets.only(top: height(context) * 0.032, right: width(context) * 0.024),
          child: IconButton(
              onPressed: () {}, icon: SvgPicture.asset(MyIcons.productBag)),
        )
      ],
    );
  }
}
