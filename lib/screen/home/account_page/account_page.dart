import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:products_app/screen/home/account_page/widget/account_head.dart';
import 'package:products_app/screen/home/account_page/widget/account_notification.dart';
import 'package:products_app/screen/home/account_page/widget/account_voucher.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/utils/my_utils.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: height(context) * 0.03),
        const AccountHead(),
        SizedBox(height: height(context) * 0.04),
        const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              MyImages.tourThreePage,
            )),
       
        SizedBox(height: height(context) * 0.03),
       
        const Text('Yona Angela',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
        
        const Text('yona.angela@email.com', style: TextStyle()),
        
        SizedBox(height: height(context) * 0.036),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyRoute.adminPage);
            },
            child: box(height(context), MyIcons.notificationTwo, 'Notification',
              const Color(0xFF3B87E0)),
          ),
          
          InkWell(
            onTap: () {
              showMaterialModalBottomSheet(
                  context: context,
                  duration: const Duration(microseconds: 300000),
                  builder: (context) {
                    return const AccountVoucher();
                  });
            },
            child: box(height(context), MyIcons.voucher, 'Voucher',
               const Color(0XFF26AD71)),
          ),
          box(height(context), MyIcons.love, 'Wishlist',
             const Color(0XFFEC534A))
        ]),
     
        SizedBox(height: height(context) * 0.03),
        boxLong(height(context), width(context), MyIcons.person,
            'My Profile', const Color(0XFF26AD71), true),
        SizedBox(height: height(context) * 0.022),
        InkWell(
          onTap: () {
            showMaterialModalBottomSheet(
                context: context,
                duration: const Duration(microseconds: 300000),
                builder: (context) {
                  return const AccountNotification();
                });
          },
          child: boxLong(
              height(context),
              width(context),
              MyIcons.setting,
              'Notification Setting',
              const Color(0XFF26AD71),
              true),
        ),
        SizedBox(height: height(context) * 0.022),
        InkWell(onTap: () {
          Navigator.pushNamed(context, MyRoute.authPage);
        },
        child: boxLong(height(context), width(context), MyIcons.logOut,
            'Log Out', const Color(0XFFEC534A), false),
        )
        
      ]),
    );
  }

  box(height, icon, word, color) {
    return Container(
      height: height * 0.14,
      width: height * 0.12,
      decoration: BoxDecoration(
          color: const Color(0xFFF1F3F2),
          // color: Colors.red,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SizedBox(height: height * 0.03),
          SvgPicture.asset(
            icon,
            color: color,
          ),
          SizedBox(height: height * 0.01),
          Text(word, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  boxLong(height, width, icon, word, color, isTrue) {
    return Stack(
      children: [
        Container(
          height: height * 0.08,
          width: width * 0.9,
          decoration: BoxDecoration(
              color: const Color(0xFFF1F3F2),
              // color: Colors.red,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: SvgPicture.asset(
                  icon,
                  color: color,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.054),
                child: Text(
                  word,
                  style:const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: height * 0.024,
            left: width * 0.79,
            child: isTrue ?const Icon(Icons.chevron_right_sharp) : Container())
      ],
    );
  }
}
