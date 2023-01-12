import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:products_app/data/models/orders_model.dart';
import 'package:products_app/utils/my_utils.dart';

class OrderRepositories {
  final FirebaseFirestore _firestore;

  OrderRepositories({required FirebaseFirestore firestore})
       :_firestore = firestore;

  Future<void> addOrder({required OrdersModel ordersModel}) async {
    try {
      DocumentReference newOrder =
       await _firestore.collection('orders').add(ordersModel.toJson());
       await _firestore.collection('orders').doc(newOrder.id).update({
        'orderId': newOrder.id
       });
       MyUtils.getMyToast(message: "Buyurtma muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch(erorr) {
      MyUtils.getMyToast(message: erorr.message.toString());
    }
  }

  Future<void> deleteOrderById({required String docID}) async {
    try {
      await _firestore.collection('orders').doc(docID).delete();
      MyUtils.getMyToast(message: 'Muvaffaqiyatli Ochirildi!');
    } on FirebaseException catch (erorr) {
      MyUtils.getMyToast(message: erorr.message.toString());
    }
  }
 
  Future<void> updateOrder({required OrdersModel ordersModel}) async {
    try {
      await _firestore
           .collection('orders')
           .doc(ordersModel.orderId)
           .update(ordersModel.toJson());
      MyUtils.getMyToast(message: 'Muvaffaqiyatli yangilandi');
    } on FirebaseException catch(erorr) {
      MyUtils.getMyToast(message: erorr.message.toString());
    }
  }

  Stream<List<OrdersModel>> getOrder() =>
         _firestore.collection('orders')
             .snapshots()
             .map((event) => event.docs
             .map((e) => OrdersModel.fromJson(e.data()))
             .toList());
  
  Stream<List<OrdersModel>> getOrderByUserId({required String userId}) =>
         _firestore.collection('orders')
         .where('userId',isEqualTo: userId)
         .snapshots()
         .map((event) => event.docs
         .map((e) => OrdersModel.fromJson(e.data()))
         .toList());
  
         

}