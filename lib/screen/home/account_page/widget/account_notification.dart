import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/screen/home/account_page/widget/widget/account_switch.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_check_out_page.dart';
import 'package:products_app/utils/my_utils.dart';

class AccountNotification extends StatefulWidget {
  const AccountNotification({super.key});

  @override
  State<AccountNotification> createState() => _AccountNotificationState();
}

class _AccountNotificationState extends State<AccountNotification> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: height(context) * 0.03),
        Padding(
            padding: EdgeInsets.only(left: width(context) * 0.06),
            child: back(context)),
        SizedBox(height: height(context) * 0.05),
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.06),
          child: const Text(
            'Notification\nSetting',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: height(context) * 0.028),
        AccountSwitch(wordLineOne: 'Tracking Updates', wordLineTwo: 'lorem ipsum dolor sit amet', isTrue: isTrue),
        AccountSwitch(wordLineOne: 'Stock Notification', wordLineTwo: 'lorem ipsum dolor sit amet', isTrue: isTrue),
        AccountSwitch(wordLineOne: 'Discount and Sales', wordLineTwo: 'lorem ipsum dolor sit amet adiscipum', isTrue: isTrue),
        AccountSwitch(wordLineOne: 'Daily Promo', wordLineTwo: 'lorem ipsum dolor sit amet ', isTrue: isTrue),
        SizedBox(height: height(context)*0.17),
        Center(child: BagCheckOutPage())
        
        
      ]),
    );
  }
}
