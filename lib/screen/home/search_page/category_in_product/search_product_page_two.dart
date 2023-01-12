import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class SearchProductPageTwo extends StatefulWidget {
  final double height1;
  final double width1;
  final int count;
  final double extent;

  const SearchProductPageTwo({
    super.key,
    required this.height1,
    required this.width1,
    required this.count,
    required this.extent,
  });

  @override
  State<SearchProductPageTwo> createState() => _SearchProductPageTwoState();
}

bool isTrue = false;
bool favoriteTrue = false;

class _SearchProductPageTwoState extends State<SearchProductPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: EdgeInsets.only(right: width(context) * 0.04),
          child: SizedBox(
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
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoute.productPage,arguments: 
                           {'product': viewModel.products[index]});
                          },
                        child: Container(
                          height: height(context) * 0.18,
                          width: width(context),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width(context) * 0.04),
                                  child: Image.network(
                                    products.imageUrl,
                                    cacheHeight: 126,
                                    cacheWidth: 120,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height(context) * 0.034),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                          left: height(context) * 0.01,
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
                                            left: height(context) * 0.01),
                                        child: RichText(
                                          text: TextSpan(
                                              text: '\$ ${products.price}/',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: const Color(0XFF2EC158)
                                                    .withOpacity(0.8),
                                              ),
                                              children: const [
                                                TextSpan(
                                                  text: 'kg',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ]),
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
                                top: height(context) * 0.026,
                                left: width(context) * 0.75,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      favoriteTrue = !favoriteTrue;
                                    });
                                    
                                  },
                                  child: favorite(context, favoriteTrue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
          }))),
        );
      },
    );
  }
}
