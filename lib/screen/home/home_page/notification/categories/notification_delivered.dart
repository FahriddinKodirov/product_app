import 'package:flutter/material.dart';
import 'package:products_app/screen/home/home_page/notification/categories/widget/order_widget.dart';
import 'package:products_app/utils/my_icons.dart';

class NotificationDelivery extends StatelessWidget {
  const NotificationDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        OrderWidget(orderColor:const Color(0xFFF1F4F3), header: 'Past',)
      ],)
      
    );
  }
}
