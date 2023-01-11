import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/screen/home/product_page.dart/widget/product_add_to_bag.dart';
import 'package:products_app/screen/home/product_page.dart/widget/product_status.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_utils.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: height(context) * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height(context) * 0.034, left: width(context) * 0.055),
                child: back(context),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height(context) * 0.032, right: width(context) * 0.024),
                child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(MyIcons.productBag)),
              )
            ],
          ),
          SizedBox(
            height: height(context) * 0.5,
            width: width(context) * 0.9,
            child: Stack(
              children: [
                SizedBox(
                    height: height(context) * 0.5,
                    width: width(context) * 0.9,
                    child: Image.asset(
                      MyImages.tourThreePage,
                      width: width(context) * 0.4,
                    )),
                Positioned(
                    top: -height(context) * 0.05,
                    right: -width(context) * 0.03,
                    child: SvgPicture.asset(
                      MyIcons.productLove,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width(context) * 0.07),
            child: Row(children: [
              SvgPicture.asset(MyIcons.kamaz),
              SizedBox(width: width(context) * 0.02),
              const Text(
                'Free shipping ',
                style: TextStyle(color: MyColors.C_53E88B),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(right: width(context) * 0.6, top: height(context) * 0.016),
            child:const Text('Mango',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: height(context) * 0.026),
          const ProductStatus(),
          Padding(
            padding: EdgeInsets.only(right: width(context) * 0.52, top: height(context) * 0.036),
            child: const Text('Description',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          ),
        ]),
        bottomNavigationBar:const ProductAddToBag());
  }
}
