import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/screen/home/account_page/admin/admin_page.dart';
import 'package:products_app/screen/home/home_page/widget/category_page.dart';
import 'package:products_app/screen/home/search_page/widget/search_all_categories.dart';
import 'package:products_app/screen/home/search_page/widget/search_page_search.dart';
import 'package:products_app/screen/home/search_page/widget/search_product_page.dart';
import 'package:products_app/screen/home/search_page/widget/search_product_page_two.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isTrue = false;
  bool isFalse = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: height(context) * 1.2,
        child: Scaffold(
          body: SafeArea(
            child: StreamBuilder<List<CategoryModel>>(
                stream: Provider.of<CategoriesViewModel>(context)
                    .listenCategories(),
                builder: (context, snapshot) {
                  List<CategoryModel> categories = snapshot.data!;
                  int categoryLenth = categories.length;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: height(context) * 0.034,
                                  left: width(context) * 0.055),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: back(context),
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(top: height(context) * 0.032),
                            child: Text(isFalse.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height(context) * 0.032,
                                right: width(context) * 0.024),
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(MyIcons.productBag)),
                          )
                        ],
                      ),
                      SizedBox(height: height(context) * 0.04),
                      SearchPageSearch(
                        onClicaction: () {
                          setState(() {
                            isFalse = !isFalse;
                          });
                        },
                      ),
                      // notFounPage(context),
                      SizedBox(height: height(context) * 0.02),
                      Padding(
                          padding:
                              EdgeInsets.only(left: height(context) * 0.022),
                          child: isFalse
                              ? Column(
                                children:  [
                                   const CategoryPage(),
                                   SizedBox(height: height(context)*0.028),
                                   SearchProductPageTwo(
                                    categoryLenth: categoryLenth,
                                    height1: height(context)*0.5,
                                    width1: width(context)*0.9,
                                    categoryModel: categories[1],
                                    count: 1,
                                    extent: height(context)*0.16,)
                                   

                                ],
                              )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: height(context) * 0.022),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Categories'.toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isTrue = !isTrue;
                                                });
                                              },
                                              child: isTrue
                                                  ? SvgPicture.asset(
                                                      MyIcons.figuraOne)
                                                  : SvgPicture.asset(
                                                      MyIcons.figuraTwo)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height(context) * 0.03),

                                    //  gridWiew(height: height(context)*0.5, width: width(context)*0.9, count: 2, extent: height(context)*0.31, search: SearchProductPage(), categoryLenth: categoryLenth),
                                    //  gridWiew(height: height(context)*0.5, width: width(context)*0.9, count: 1, extent: height(context)*0.18, search: SearchProductPageTwo(), categoryLenth: categoryLenth),

                                    isTrue
                                        ? SaerchAllCategories(
                                            height1: height(context) * 0.677,
                                            width1: width(context) * 0.9,
                                            count: 2,
                                            extent: height(context) * 0.2,
                                            categoryModel: categories,
                                            categoryLenth: categoryLenth,
                                            isTrue: false,
                                          )
                                        : SaerchAllCategories(
                                            height1: height(context) * 0.677,
                                            width1: width(context) * 0.9,
                                            count: 1,
                                            extent: height(context) * 0.2,
                                            categoryModel: categories,
                                            categoryLenth: categoryLenth,
                                            isTrue: true,
                                          )
                                  ],
                                )),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
