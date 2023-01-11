import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class BagKartaTracking extends StatelessWidget {
  final String word;
  final String date;
  final Color  myColorBox;
  final String  myIcon; 

  const BagKartaTracking({super.key,
                     required this.word,
                     required this.date,
                     required this.myColorBox,
                     required this.myIcon,
                     });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width(context)*0.1),
          child: Container(
            height: height(context) * 0.1,
            width: width(context) * 0.9,
            decoration: BoxDecoration(
                color: const Color(0xFFEBF4F1), borderRadius: BorderRadius.circular(18)),
            child: Padding(
                padding: EdgeInsets.only(left: width(context) * 0.03, top: height(context) * 0.01),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.055, bottom: height(context) * 0.01),
                      child: SvgPicture.asset(
                        myIcon,
                        width: 25,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width(context) * 0.06, top: height(context) * 0.018),
                          child: Text(
                            word,
                            style: const TextStyle(color: MyColors.C_53E88B),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width(context) * 0.06, top: height(context) * 0.005),
                          child: Text(
                            date,
                            style: const TextStyle(color: MyColors.C_53E88B),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
        SizedBox(height: height(context)*0.03),
        adress(width(context), height,const Color(0xFFCFEFE4), MyColors.C_53E88B),
        SizedBox(height: height(context)*0.03),
        adress(width(context), height,const Color(0xFFF8ECEC),const Color(0xFFEC534A)),
        SizedBox(height: height(context)*0.04),
        Row(
          children: [
            Padding(
                  padding:
                      EdgeInsets.only(left: width(context) * 0.095),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        MyIcons.circuleBag,
                        width: 18,
                      ),
                      Positioned(
                        top: height(context)*0.0055,
                        left: width(context)*0.013,
                        child: SvgPicture.asset(MyIcons.circuleLittle,width: 9,))
                    ],
                  ),
                ),
            Padding(
              padding: EdgeInsets.only(left: width(context)*0.06),
              child: const Text('See 2 more updates',style: TextStyle(color: MyColors.C_53E88B),),
            ),
          ],
        )
      ],
    );
  }

  adress(width,height,color,color2) {
    return  Padding(
          padding: EdgeInsets.only(left: width*0.035),
          child: Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.055),
                  child:Stack(
                    children: [
                      SvgPicture.asset(
                        MyIcons.circuleBag,
                        width: 18,
                        color: color,
                      ),
                      Positioned(
                        top: height*0.0055,
                        left: width*0.013,
                        child: SvgPicture.asset(MyIcons.circuleLittle,width: 9,color: color2,))
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06, top: height * 0.018),
                      child: Text(
                        word,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06, top: height * 0.007),
                      child: Text(
                        date,
                      
                      ),
                    )
                  ],
                )
              ],
            ),
        );
  }
}
