import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class ProductStatus extends StatelessWidget {
  final ProductModel product;

  const ProductStatus({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.06),
          child: Container(
            height: height(context) * 0.044,
            width: height(context) * 0.104,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.05)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width(context) * 0.02),
                    child: SvgPicture.asset(
                      MyIcons.star,
                      width: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(context) * 0.02),
                    child: const Text(
                      '4.7',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.035),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.044,
            width: MediaQuery.of(context).size.height * 0.104,
            decoration: BoxDecoration(
                color: const Color(0xFFEBF4F1),
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.05)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width(context) * 0.02),
                    child: const Text('🥝'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width(context) * 0.01),
                    child: const Text(
                      'Fruits',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: width(context) * 0.16),
          child: RichText(
            text: TextSpan(
            text: '\$ ${product.price}/',
            style:const TextStyle(color: MyColors.C_53E88B, fontSize: 22),
            children:const [
            TextSpan(
            text: 'kg',
            style: TextStyle(color: Colors.black38, fontSize: 16),),
            ]
          ),
          
          ),
        ),
      ],
    );
  }
}
