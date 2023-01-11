import 'package:flutter/material.dart';
import 'package:products_app/screen/home/home_page/notification/categories/widget/order_widget.dart';

class NotificationCanceled extends StatelessWidget {
  const NotificationCanceled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        OrderWidget(orderColor:const Color(0xFFF8ECEC), header: 'Past',),
      ]),
    );
  }
}