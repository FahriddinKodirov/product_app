import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class BagProductPage extends StatelessWidget {
  const BagProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.18,
      width: width(context),
      decoration: BoxDecoration(
          color: const Color(0xFFDEE6E3).withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Row(children: [
            SvgPicture.asset(
              MyIcons.apple,
              width: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height(context)  * 0.02),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: height(context)  * 0.02, top: height(context)  * 0.006),
                    child: const Text(
                      'Mango',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: height(context)  * 0.02, top: height(context)  * 0.006),
                    child: const Text(
                      '3kg',
                      style:
                          TextStyle(),
                    )),
                SizedBox(height: height(context)  * 0.01),
                Row(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: height(context)  * 0.02),
                        child: Text(
                          '\$ 12.2',
                          style: TextStyle(
                            fontSize: 22,
                            color:const Color(0XFF2EC158).withOpacity(0.8),
                          ),
                        )),
                Padding(
                  padding: EdgeInsets.only(left: width(context)*0.1),
                  child: Row(
                    children: [
              Container(
                    height: height(context)  * 0.036,
                    width: height(context)  * 0.036,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child:const Center(
                        child: Text(
                      '+',
                      style: TextStyle(fontSize: 22),
                    ))),
              SizedBox(width: width(context) * 0.04),
               const Text(
                  '3',
                  style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: width(context) * 0.04),
              Container(
                    height: height(context)  * 0.036,
                    width: height(context)  * 0.036,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                        child: Text(
                      '-',
                      style: TextStyle(fontSize: 26),
                    )))
            ]),
                ),
                  ],
                ),
              ],
            )
          ]),
         
          Positioned(
              top: height(context)  * 0.03,
              left: width(context) * 0.75,
              child: const Icon(
                Icons.favorite_border_rounded,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
