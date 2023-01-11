import 'package:flutter/material.dart';
import 'package:products_app/screen/home/home_page/notification/categories/notification_all.dart';
import 'package:products_app/screen/home/home_page/notification/categories/notification_canceled.dart';
import 'package:products_app/screen/home/home_page/notification/categories/notification_delivered.dart';
import 'package:products_app/screen/home/home_page/notification/categories/notification_on_delivery.dart';
import 'package:products_app/screen/home/home_page/notification/widget/search_page_notification.dart';
import 'package:products_app/utils/my_utils.dart';

class NotificationTabBar extends StatelessWidget {
  const NotificationTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height(context) * 0.22,
          flexibleSpace: Column(children: [
            SizedBox(height: height(context) * 0.06),
            Row(children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: width(context) * 0.05),
                  child: back(context)),
              Padding(
                  padding: EdgeInsets.only(left: width(context) * 0.17),
                  child: const Text('Notification',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black)))
            ]),
            SizedBox(
              height: height(context) * 0.04,
            ),
            const SearchPageNotification(),
          ]),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: const Color(0XFF2EC158),
            splashBorderRadius: BorderRadius.circular(20),
            labelColor: Colors.black,
            padding: const EdgeInsets.only(bottom: 4, left: 10),
            indicator: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            isScrollable: true,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'On Delivery'),
              Tab(text: 'Delivered'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          NotificationAll(),
          NotificationOnDelivered(),
          NotificationDelivery(),
          NotificationCanceled(),
        ]),
      ),
    );
  }
}
