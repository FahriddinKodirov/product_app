import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class ProductAddToBag extends StatelessWidget {
  const ProductAddToBag({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width(context) * 0.06, top: height(context) * 0.02),
            child: Row(children: [
              Container(
                  height: height(context)  * 0.05,
                  width: width(context)  * 0.1,
                  decoration: BoxDecoration(
                      color:const Color(0xFFDEE6E3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child:const Center(
                      child: Text(
                    '+',
                    style: TextStyle(fontSize: 26),
                  ))),
              SizedBox(width: width(context)  * 0.04),
              const Text(
                '3',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(width: width(context)  * 0.04),
              Container(
                  height: height(context)  * 0.05,
                  width: width(context)  * 0.1,
                  decoration: BoxDecoration(
                      color:const Color(0xFFDEE6E3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child:const Center(
                      child: Text(
                    '+',
                    style: TextStyle(fontSize: 26),
                  )))
            ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: width(context)  * 0.0731, top: height(context)  * 0.0228),
            child: Stack(
              children: [
                SvgPicture.asset(
                  MyIcons.addToBag,
                  color:const Color(0XFF2EC158),
                  width: height(context)  * 0.25,
                ),
                Positioned(
                    left: width(context)  * 0.42,
                    top: height(context) * 0.048,
                    child: Container(
                      height: height(context) * 0.06,
                      width: width(context)  * 0.125,
                      color:const Color(0XFF2EC158),
                    )),
                Positioned(
                    top: height(context) * 0.046,
                    left: width(context)  * 0.21,
                    child:const Text(
                      'Add to bag',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
