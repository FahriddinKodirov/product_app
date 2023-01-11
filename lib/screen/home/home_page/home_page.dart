import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/screen/home/home_page/notification/categories/notification_all.dart';
import 'package:products_app/screen/home/home_page/notification/notification_tabBar.dart';
import 'package:products_app/screen/home/home_page/widget/category_page.dart';
import 'package:products_app/screen/home/home_page/widget/claim.dart';
import 'package:products_app/screen/home/home_page/widget/popular_page.dart';
import 'package:products_app/screen/home/home_page/widget/search_page.dart';
import 'package:products_app/screen/home/home_page/widget/show_dio_page.dart';
import 'package:products_app/screen/home/search_page/search_page.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: SizedBox(
        height: 900,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: StreamBuilder<List<CategoryModel>>(
              stream: Provider.of<CategoriesViewModel>(context).listenCategories(),
              builder: (context, snapshot) {
                return Column(children: [
                  SizedBox(height: height(context) * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                          backgroundImage: AssetImage(MyImages.tourThreePage)),
                      const ShowDilogPage(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> const NotificationTabBar()));
                        },
                        child: SvgPicture.asset(MyIcons.notification),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height(context) * 0.055,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: height(context) * 0.03),
                      alignment: Alignment.topLeft,
                      child: const Text('Hey Yona 👋',
                          style:
                              TextStyle(fontSize: 26, fontWeight: FontWeight.w800))),
                  Container(
                      padding:
                          EdgeInsets.only(left: height(context) * 0.03, top: height(context) * 0.01),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Find fresh groceries you want',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black26),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: width(context) * 0.028, top: height(context) * 0.035),
                      child: const HomeSearchPage()),
                  SizedBox(height: height(context) * 0.03),
                   const ClaimPage(),
                  SizedBox(height: height(context) * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height(context)*0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      InkWell(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchPage()));
                      },  
                      child: const Text('See all',style: TextStyle(color: Colors.green),)),
                     
                    ],),
                    
                  ),
                   Padding(
                     padding: EdgeInsets.only(left: width(context)*0.06,top: height(context)*0.019),
                     child: const CategoryPage()
                   ),
                   SizedBox(height: height(context)*0.04),
                   Container(
                    padding: EdgeInsets.only(left: width(context)*0.06),
                    alignment: Alignment.topLeft,
                        child: const Text('Popular',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: width(context)*0.06,top: height(context)*0.019),
                      child: const PopularPage(),
                    )
                ]);
              }
            ),
          ),
        ),
      ),
    );
  }
}
