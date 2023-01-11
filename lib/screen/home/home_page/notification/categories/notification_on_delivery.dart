import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class NotificationOnDelivered extends StatelessWidget {
  const NotificationOnDelivered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width(context) * 0.05, top: height(context) * 0.02),
          child: Row(
            children: [
              const Text(
                'Now',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(context) * 0.07),
                child: Container(
                  height: height(context) * 0.04,
                  width: width(context) * 0.18,
                  decoration: BoxDecoration(
                      color: const Color(0XFF2EC158).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    '1',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: width(context) * 0.0, top: height(context) * 0.02),
          child: Container(
            height: height(context) * 0.26,
            width: width(context) * 0.9,
            decoration: BoxDecoration(
                color: const Color(0xFFDEE6E3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    MyIcons.apple,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order 08/20/2021',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$ 12.2',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0XFF2EC158).withOpacity(0.8),
                        ),
                      ),
                      const Divider(thickness: 0.8, color: Colors.black45),
                      const Text(
                        'On delivery to Yona’s Home',
                        style: TextStyle(color: Colors.black45),
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: height(context) * 0.12,
                width: width(context) * 0.9,
                color: Colors.blue,
                child: const Center(
                    child: Text(
                  'karta',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
              )
            ]),
          ),
        )
      ],
    ));
  }
}
