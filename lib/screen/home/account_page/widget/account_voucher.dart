import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_utils.dart';

class AccountVoucher extends StatelessWidget {
  const AccountVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height(context) * 0.03),
              Padding(
                  padding: EdgeInsets.only(left: width(context) * 0.06),
                  child: back(context)),
              SizedBox(height: height(context)  * 0.05),
              Padding(
                padding: EdgeInsets.only(left: width(context) * 0.06),
                child:  const Text(
                  'Your Voucher',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: height(context)  * 0.03),
              images(MyImages.voucherOne, height(context) , width(context)),
              images(MyImages.voucherTwo, height(context) , width(context)),
              images(MyImages.voucherThree, height(context) , width(context)),
            ],
          )),
    );
  }

  images(image, height, width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.055,vertical: height*0.01),
      child: Stack(
        children: [
          Image.asset(image),
          Positioned(
              top: height * 0.02,
              left: width * 0.07,
              child: const Text(
                'Discount All Fruits',
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
          Positioned(
              top: height * 0.07,
              left: width * 0.07,
              child: const Text(
                '50%',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              )),
          Positioned(
              top: height * 0.125,
              left: width * 0.07,
              child: const Text('discount', style: TextStyle())),
          Positioned(
              top: height * 0.1766,
              left: width * 0.07,
              child: SvgPicture.asset(MyIcons.exclamation,width: 10,)),
          Positioned(
              top: height * 0.175,
              left: width * 0.1,
              child: const Text('valid until September 20 2021',
                  style: TextStyle(fontSize: 10))),
        ],
      ),
    );
  }
}
