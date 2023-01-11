import 'package:flutter/material.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_product_page.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_check_out_page.dart';
import 'package:products_app/utils/my_utils.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: SizedBox(
        height: height(context) * 1.2,
        child: Scaffold(
          body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: height(context) * 0.032,
                    left: width(context) * 0.05,
                  ),
                  child: back(context)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.07,
                    vertical: height(context) * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'My Bag',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    Text('0 items', style: TextStyle(color: Colors.black26)),
                  ],
                ),
              ),
              // Center(child: notFounPage(context: context,wordLineOne: 'It’s lonely here',wordLineTwo: 'Start and add more items to the bag.')),
           
              // Padding(
              //     padding: EdgeInsets.only(left: width(context) * 0.046),
              //     child: 
              //     gridWiew(
              //         height: height(context) * 0.5,
              //         width: width(context) * 0.9,
              //         count: 1,
              //         extent: height(context) * 0.16,
              //         search: const BagProductPage())
              //         ),
              SizedBox(height: height(context) * 0.03),

              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      height: height(context) * 0.1,
                      width: width(context) * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: const Color(0xFFDEE6E3).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Add Promo Code'),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: width(context) * 0.14),
                              child: Container(
                                height: height(context) * 0.05,
                                width: width(context) * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ]))),
              check(context,
                  word: 'Total',
                  money: '12.2',
                  myColor:const Color(0XFF2EC158).withOpacity(0.8)),
              SizedBox(height: height(context) * 0.003),

              check(context,
                  word: 'Discount', money: '5.2', myColor: Colors.red),
              SizedBox(height: height(context) * 0.04),

              check(context,
                  word: 'Total',
                  money: '12.2',
                  myColor: const Color(0XFF2EC158).withOpacity(0.8)),

              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.06,
                      vertical: height(context) * 0.03),
                  child: const BagCheckOutPage())
            ]),
          ),
        ),
      ),
    );
  }
}
