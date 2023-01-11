import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class BagCheckOutPage extends StatefulWidget {
  const BagCheckOutPage({super.key});

  @override
  State<BagCheckOutPage> createState() => _BagCheckOutPageState();
}

class _BagCheckOutPageState extends State<BagCheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            constraints: BoxConstraints(maxHeight: height(context) * 0.45),
            context: context,
            builder: ((context) {
              return Column(
                children: [
                  SizedBox(
                    height: height(context)  * 0.45,
                    width: width(context),
                    child: Column(
                      children: [
                        SizedBox(height: height(context)  * 0.03),
                        SvgPicture.asset(MyIcons.ok),
                        SizedBox(height: height(context)  * 0.03),
                        const Text('Success!',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        SizedBox(height: height(context)  * 0.02),
                        const Text('You have successfully created',
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: height(context)  * 0.0006),
                        const Text('your order.',
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: height(context)  * 0.04),
                        Container(
                          height: height(context)  * 0.08,
                          width: width(context) * 0.9,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(height(context)  * 0.06),
                              gradient: gradientGreen()),
                          child: const Center(
                              child: Text(
                            'Browse Home',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }));
      },
      child: Container(
        height: height(context) * 0.08,
        width: width(context) * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height(context)  * 0.06),
            gradient: gradientGreen()),
        child: const Center(
            child: Text(
          'Proceed To Checkout',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
