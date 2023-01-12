import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/screen/home/search_page/category_in_product/search_product_page.dart';
import 'package:products_app/screen/home/search_page/category_in_product/search_product_page_two.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class SearchCategoryInProductPage extends StatefulWidget {
  const SearchCategoryInProductPage({super.key});

  @override
  State<SearchCategoryInProductPage> createState() =>
      _SearchCategoryInProductPageState();
}

class _SearchCategoryInProductPageState
    extends State<SearchCategoryInProductPage> {
  String categoryHeaderName = '';
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: height(context) * 0.126,
            width: width(context),
            child: StreamBuilder<List<CategoryModel>>(
                stream: Provider.of<CategoriesViewModel>(context)
                    .listenCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<CategoryModel> categories = snapshot.data!;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Provider.of<ProductViewModel>(context,
                                    listen: false)
                                .listenProducts(categories[index].categoryId);
                                categoryHeaderName = categories[index].categoryName;
                                setState(() {});
                          },
                          child: Column(
                            children: [
                              Container(
                                height: height(context) * 0.09,
                                width: width(context) * 0.2,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black26),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(categories[index].icon),
                                ),
                              ),
                              SizedBox(height: height(context) * 0.005),
                              Text(categories[index].categoryName)
                            ],
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return SizedBox(width: width(context) * 0.03);
                      },
                    );
                  } else {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                })),
        SizedBox(height: height(context) * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: height(context) * 0.028),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All $categoryHeaderName',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = !isTrue;
                    });
                  },
                  child: isTrue
                      ? SvgPicture.asset(MyIcons.figuraOne)
                      : SvgPicture.asset(MyIcons.figuraTwo)),
            ],
          ),
        ),
        SizedBox(height: height(context) * 0.03),
        isTrue?SearchProductPage(
          height1: height(context) * 0.5,
          width1: width(context) * 0.9,
          count: 2,
          extent: height(context) * 0.28,
        ):
        SearchProductPageTwo(
          height1: height(context) * 0.5,
          width1: width(context) * 0.9,
          count: 1,
          extent: height(context) * 0.16,
        )
      ],
    );
  }
}
