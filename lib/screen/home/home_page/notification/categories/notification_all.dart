import 'package:flutter/material.dart';
import 'package:products_app/screen/home/home_page/notification/categories/notification_canceled.dart';
import 'package:products_app/utils/my_utils.dart';

class NotificationAll extends StatelessWidget {
  const NotificationAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height(context)*1.3,
        child: Scaffold(
          body: Column(
            children:const [
            NotificationCanceled()
          
          ])
        ),
      ),
    );
  }
}
