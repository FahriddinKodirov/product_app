import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class SearchProductPage extends StatefulWidget {
  final double height1;
  final double width1;
  final int count;
  final double extent;

  const SearchProductPage(
      {super.key,
      required this.height1,
      required this.width1,
      required this.count,
      required this.extent});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  bool favoriteTrue = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRoute.productPage);
          },
          child: Padding(
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
                        color: const Color(0xfffbd1d8),
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
                    height: height(context) * 0.35,
                    width: width(context) * 0.46,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: height(context)*0.02),
                            child: Image.network(
                              products.imageUrl,
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                top: height(context) * 0.01,
                                left: height(context) * 0.02,
                              ),
                              child: Text(
                                products.productName,
                                style:const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: height(context) * 0.02),
                            child: RichText(
                              text: TextSpan(
                                text: '\$${products.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color(0XFF2EC158).withOpacity(0.8),
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'kg',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                        Positioned(
                            top: height(context) * 0.228,
                            left: width(context) * 0.28,
                            child: SvgPicture.asset(MyIcons.plus,
                                color: Color(0XFF2EC158))),
                        Positioned(
                            top: height(context) * 0.236,
                            left: width(context) * 0.338,
                            child: const Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )),
                        Positioned(
                            top: height(context) * 0.17,
                            left: width(context) * 0.3,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  favoriteTrue = !favoriteTrue;
                                });
                              },
                              child: favorite(context, favoriteTrue),
                            )),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
              ),
        );
      },
    
    );
  }
}
