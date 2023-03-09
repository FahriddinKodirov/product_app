import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/screen/home/product_page.dart/widget/product_add_to_bag.dart';
import 'package:products_app/screen/home/product_page.dart/widget/product_status.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool favoriteTrue = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, value, child) {
       return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: height(context) * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height(context) * 0.034, left: width(context) * 0.055),
                  child: InkWell(
                    onTap:() {
                      Navigator.pop(context);
                    }, child: back(context),),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height(context) * 0.032, right: width(context) * 0.024),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(MyIcons.productBag)),
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                    height: height(context) * 0.5,
                    width: width(context) * 0.95,
                    child: Image.network(
                      widget.product.imageUrl,
                    )),
                Positioned(
                    top: height(context) * 0.42,
                    right: width(context)*0.001,
                    child:InkWell(
                      onTap: () {
                        setState(() {
                          favoriteTrue = !favoriteTrue;
                        });
                        
                      },
                      child:bigFavorite(context, favoriteTrue) ,
                    )
                     
                    )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width(context) * 0.07),
              child: Row(children: [
                SvgPicture.asset(MyIcons.kamaz),
                SizedBox(width: width(context) * 0.02),
                const Text(
                  'Free shipping ',
                  style: TextStyle(color: MyColors.C_53E88B),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: width(context)*0.06, top: height(context) * 0.016),
              child: Text(widget.product.productName,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: height(context) * 0.026),
            ProductStatus(product: widget.product,),
            Padding(
              padding: EdgeInsets.only(left: width(context) * 0.06, top: height(context) * 0.036),
              child:const Text('Discription',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width(context)*0.06),
              child: Text(widget.product.description),
            )
          ]),
          bottomNavigationBar: ProductAddToBag(product: widget.product, count: count,));
      },
    );
  }
}
