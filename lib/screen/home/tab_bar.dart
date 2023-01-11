import 'package:flutter/material.dart';
import 'package:products_app/screen/home/account_page/account_page.dart';
import 'package:products_app/screen/home/account_page/admin/admin_page.dart';
import 'package:products_app/screen/home/bag_page/bag_page.dart';
import 'package:products_app/screen/home/home_page/home_page.dart';
import 'package:products_app/screen/home/search_page/search_page.dart';
import 'package:products_app/utils/my_colors.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int index = 0;
  final List _list = const [HomePage(), AdminPage(), BagPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: _list[index],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(height: 1.6),
          selectedIconTheme: const IconThemeData(
              color: MyColors.C_53E88B,
              shadows: [Shadow(color: Colors.black, offset: Offset(4, 4))]),
          elevation: 8,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          fixedColor: Colors.black,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.photo_camera,
                  size: 30,
                ),
                label: 'Scan'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  size: 30,
                ),
                label: 'Bag'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'Account'),
          ]),
    );
  }
}
