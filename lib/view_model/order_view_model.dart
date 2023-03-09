import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:products_app/data/models/orders_model.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/data/repositories/order_repositories.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderRepositories orderRepositories;

  OrderViewModel({required this.orderRepositories}){
    listenOrders(FirebaseAuth.instance.currentUser!.uid);
  }
  
   late StreamSubscription subscription;
   
   ProductModel? productModel;
   List<OrdersModel> userOrders = [];

   listenOrders(String userId) async {
    subscription =
     orderRepositories.getOrderByUserId(userId: userId).listen((event) { 
      userOrders = event;
      notifyListeners();
     });
   }
  //  ---------------------------------------------------------------------
    updateOrderIfexists({required String productId,required int count}) {
      OrdersModel ordersModel =
          userOrders.firstWhere((element) => element.productId == productId);

      int currentCount = ordersModel.count;
      int price = ordersModel.totalPrice ~/ ordersModel.count;

      orderRepositories.updateOrder(
        ordersModel: ordersModel.copyWith(
          count: currentCount + count,
          totalPrice: price * (currentCount + count)
        ));
    }

  // ---------------------------------------------------
   addOrder(OrdersModel ordersModel) =>
      orderRepositories.addOrder(ordersModel: ordersModel);

   updateOrder(OrdersModel ordersModel) =>
      orderRepositories.updateOrder(ordersModel: ordersModel);

   deleteOrder(String docID) => orderRepositories.deleteOrderById(docID: docID);

   @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

}