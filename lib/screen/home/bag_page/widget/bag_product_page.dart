import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/orders_model.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_apply_page.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_check_out_page.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class BagProductPage extends StatefulWidget {
  final List orders;

  const BagProductPage({super.key, required this.orders});

  @override
  State<BagProductPage> createState() => _BagProductPageState();
}

class _BagProductPageState extends State<BagProductPage> {
  bool favoriteTrue = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.18 * widget.orders.length,
      width: width(context) * 0.9,
      child: GridView.builder(
        itemCount: widget.orders.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 14,
            crossAxisSpacing: 20,
            mainAxisExtent: height(context) * 0.16),
        itemBuilder: ((context, index) {
          OrdersModel orders = widget.orders[index];
          return Dismissible(
            behavior: HitTestBehavior.translucent,
            direction: DismissDirection.endToStart,
            key: Key(index.toString()),
            background: Container(
              decoration: BoxDecoration(
                  color: const Color(0xfffbd1d8),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: width(context) * 0.9 * 0.1),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: width(context) * 0.05),
                      child: Image.network(
                        orders.productImage,
                        cacheHeight: 125,
                        cacheWidth: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height(context) * 0.02),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding:
                                EdgeInsets.only(top: height(context) * 0.006),
                            child: Text(
                              orders.productName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding:
                                EdgeInsets.only(top: height(context) * 0.006),
                            child: Text(
                              '${orders.count}kg',
                              style: const TextStyle(),
                            )),
                        SizedBox(height: height(context) * 0.01),
                        Row(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(),
                                child: Text(
                                  '\$ ${orders.price}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: const Color(0XFF2EC158)
                                        .withOpacity(0.8),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    )
                  ]),
                  Positioned(
                    left: width(context) * 0.58,
                    top: height(context) * 0.09,
                    child: Row(children: [
                      Container(
                          height: height(context) * 0.036,
                          width: height(context) * 0.036,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            '-',
                            style: TextStyle(fontSize: 22),
                          ))),
                      SizedBox(width: width(context) * 0.04),
                      Text(
                        orders.count.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: width(context) * 0.04),
                      Container(
                          height: height(context) * 0.036,
                          width: height(context) * 0.036,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            '+',
                            style: TextStyle(fontSize: 26),
                          )))
                    ]),
                  ),
                  Positioned(
                      top: height(context) * 0.026,
                      left: width(context) * 0.75,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              favoriteTrue = !favoriteTrue;
                            });
                          },
                          child: favorite(context, favoriteTrue))),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
