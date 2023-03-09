import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:products_app/data/models/orders_model.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

class ProductAddToBag extends StatefulWidget {
  final ProductModel product;
  late int count;

  ProductAddToBag({super.key, required this.product, required this.count});

  @override
  State<ProductAddToBag> createState() => _ProductAddToBagState();
}

class _ProductAddToBagState extends State<ProductAddToBag> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width(context) * 0.06, top: height(context) * 0.02),
            child: Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (widget.count > 1) {
                      widget.count--;
                    }
                  });
                },
                child: Container(
                    height: height(context) * 0.05,
                    width: width(context) * 0.1,
                    decoration: BoxDecoration(
                        color: const Color(0xFFDEE6E3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                        child: Text(
                      '-',
                      style: TextStyle(fontSize: 26),
                    ))),
              ),
              SizedBox(width: width(context) * 0.04),
              Text(
                widget.count.toString(),
                style: const TextStyle(fontSize: 26),
              ),
              SizedBox(width: width(context) * 0.04),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.count++;
                  });
                },
                child: Container(
                    height: height(context) * 0.05,
                    width: width(context) * 0.1,
                    decoration: BoxDecoration(
                        color: const Color(0xFFDEE6E3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                        child: Text(
                      '+',
                      style: TextStyle(fontSize: 26),
                    ))),
              )
            ]),
          ),
          InkWell(
            onTap: () {
              List<OrdersModel> orders = 
                Provider.of<OrderViewModel>(context, listen: false).userOrders;
              List<OrdersModel> exists = orders
                 .where((element) => 
                    element.productId == widget.product.productId)
                    .toList();
                if(exists.isNotEmpty) {
                  orders.forEach((element) {
                    if(element.productId == widget.product.productId){
                      Provider.of<OrderViewModel>(context,listen: false)
                        .updateOrderIfexists(productId: element.productId, count: widget.count);
                    }
                  });
                } else {
                  Provider.of<OrderViewModel>(context, listen: false).addOrder(
                     OrdersModel(
                      orderId: '', 
                      userId: FirebaseAuth.instance.currentUser!.uid, 
                      productId: widget.product.productId, 
                      productName: widget.product.productName,
                      productImage: widget.product.imageUrl, 
                      price: widget.product.price, 
                      count: widget.count, 
                      totalPrice: widget.product.price * widget.count
                      )
                  );
                }
            },
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: width(context) * 0.0731, top: height(context) * 0.0228),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      MyIcons.addToBag,
                      color: const Color(0XFF2EC158),
                      width: height(context) * 0.25,
                    ),
                    Positioned(
                        left: width(context) * 0.42,
                        top: height(context) * 0.048,
                        child: Container(
                          height: height(context) * 0.06,
                          width: width(context) * 0.125,
                          color: const Color(0XFF2EC158),
                        )),
                    Positioned(
                        left: width(context) * 0,
                        top: height(context) * 0.09,
                        child: Container(
                          height: height(context) * 0.016,
                          width: width(context) * 0.625,
                          color: const Color(0XFF2EC158),
                        )),
                    Positioned(
                        top: height(context) * 0.046,
                        left: width(context) * 0.21,
                        child: const Text(
                          'Add to bag',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
