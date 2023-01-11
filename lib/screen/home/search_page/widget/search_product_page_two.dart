import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class SearchProductPageTwo extends StatefulWidget {
  final double height1;
  final double width1;
  final int count;
  final double extent;
  final int categoryLenth;
  final CategoryModel categoryModel;

  const SearchProductPageTwo({
               super.key, 
               required this.height1, 
               required this.width1, 
               required this.count, 
               required this.extent,
               required this.categoryLenth, 
               required this.categoryModel,
               });



  @override
  State<SearchProductPageTwo> createState() => _SearchProductPageTwoState();
}

bool isTrue = false;

class _SearchProductPageTwoState extends State<SearchProductPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
         return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context) * 0.028),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All ${widget.categoryModel.categoryName} Fruits',
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
          SizedBox(height: height(context)*0.03),
          SizedBox(
              height: widget.height1,
              width: widget.width1,
              child: GridView.builder(
                  itemCount: viewModel.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.count,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 20,
                      mainAxisExtent: widget.extent),
                  itemBuilder: ((context, index) {
                    ProductModel products = viewModel.products[index];
                    return Dismissible(
                      behavior: HitTestBehavior.translucent,
                      direction: DismissDirection.endToStart,
                      key: Key(index.toString()),
                      background: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: widget.width1 * 0.1),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 32,
                        ),
                      ),
                      child: Container(
                        height: height(context) * 0.18,
                        width: width(context),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            color: const Color(0xFFDEE6E3).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Row(
                                   children: [
                              Image.network(
                                products.imageUrl,
                                cacheHeight: 126,
                                cacheWidth: 120,
                                
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height(context) * 0.05),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          left: height(context) * 0.02,
                                          ),
                                      child: Text(
                                        products.productName,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  SizedBox(height: height(context) * 0.01),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          left: height(context) * 0.02),
                                      child: Text(
                                        '\$ ${products.price}/kg',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: const Color(0XFF2EC158)
                                              .withOpacity(0.8),
                                        ),
                                      )),
                                ],
                              )
                            ]),
                            Positioned(
                                top: height(context) * 0.113,
                                left: width(context) * 0.751,
                                child: SvgPicture.asset(MyIcons.plus,
                                    color: const Color(0XFF2EC158))),
                            Positioned(
                                top: height(context) * 0.12,
                                left: width(context) * 0.808,
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            Positioned(
                                top: height(context) * 0.03,
                                left: width(context) * 0.75,
                                child: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    );
                  })))
        ],
      );
      },
    );
  }
}
