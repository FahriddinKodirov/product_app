import 'package:flutter/material.dart';
import 'package:products_app/data/models/orders_model.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_apply_page.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_check_out_page.dart';
import 'package:products_app/screen/home/bag_page/widget/bag_product_page.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/order_view_model.dart';
import 'package:provider/provider.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: SizedBox(
        height: height(context) * 1.214,
        child: Scaffold(
          body: Consumer<OrderViewModel>(
            builder: (context, viewModel, child) {
              List<OrdersModel> orders = viewModel.userOrders;
              return SafeArea(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: height(context) * 0.032,
                      left: width(context) * 0.05,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:back(context) ,
                    )
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width(context) * 0.07,
                      vertical: height(context) * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        'My Bag',
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      Text('${viewModel.userOrders.length} items', style: TextStyle(color: Colors.black26)),
                    ],
                  ),
                ),
                viewModel.userOrders.isEmpty?Center(child: notFounPage(context: context,wordLineOne: 'It’s lonely here',wordLineTwo: 'Start and add more items to the bag.')):
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(context)*0.05),
                  child: BagProductPage(orders: viewModel.userOrders,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width(context) * 0.06),
                  child: Divider(thickness: 0.7,color: Colors.grey[300]),
                ),
                SizedBox(height: height(context) * 0.001),
                const BagApplyPage(),
                check(context,
                    word: 'Total',
                    money: '12.2',
                    myColor:const Color(0XFF2EC158).withOpacity(0.8)),
                SizedBox(height: height(context) * 0.003),
          
                check(context,
                    word: 'Discount', money: '5.2', myColor: Colors.red),
                SizedBox(height: height(context) * 0.04),
          
                check(context,
                    word: 'Total',
                    money: '12.2',
                    myColor: const Color(0XFF2EC158).withOpacity(0.8)),
          
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: height(context) * 0.03),
                    child: const BagCheckOutPage())
              ]),
            );
            },
          ),
        ),
      ),
    );
  }
}
