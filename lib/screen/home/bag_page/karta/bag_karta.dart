import 'package:flutter/material.dart';
import 'package:products_app/screen/home/bag_page/karta/widget/bag_kart_status_date.dart';
import 'package:products_app/screen/home/bag_page/karta/widget/bag_karta_tracking.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class BagKart extends StatelessWidget {
  const BagKart({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height(context)*1.4,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height(context) * 0.02, left: width(context) * 0.04),
                  child: back(context),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width(context) * 0.2, top: height(context) * 0.02),
                  child: const Text('Order Track'),
                )
              ],
            ),
            SizedBox(height: height(context) * 0.4),
            Padding(
              padding: EdgeInsets.only(left: width(context) * 0.08),
              child: const Text(
                'Order Datail',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: height(context) * 0.03),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: width(context) * 0.08),
                child: const Text('Status'),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(context) * 0.34),
                child: Text('Purchase Date'),
              ),
            ]),
            SizedBox(height: height(context) * 0.008),
            const BagKartStatusDate(
                word: 'On Delivery',
                date: '08/20/2021',
                myColorWord: MyColors.C_53E88B,
                myColorBox: Color(0xFFEBF4F1)),
            SizedBox(height: height(context)*0.04),
            Padding(
              padding: EdgeInsets.only(left: width(context)*0.07),
              child: const Text('Tracking Detail',style: TextStyle(fontSize: 26),),
            ),
            SizedBox(height: height(context)*0.02),
            Padding(
              padding: EdgeInsets.only(left: width(context)*0.07),
              child: const BagKartaTracking(word: 'Departed From Staging',
              date: 'DKI Jakarta -  Aug 19 2021,  19:57',myColorBox: Color(0xFFEBF4F1),myIcon: MyIcons.kartaOk,)
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
