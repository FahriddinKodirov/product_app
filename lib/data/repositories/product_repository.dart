import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_utils.dart';

class ProductRepositories {
  final FirebaseFirestore _firestore;

  ProductRepositories({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addProduct({required ProductModel productModel}) async {
    try {
      var newProduct =
          await _firestore.collection('products').add(productModel.toJson());
          await _firestore
          .collection('products')
          .doc(newProduct.id)
          .update({'productId': newProduct.id});
       MyUtils.getMyToast(message: "Maxsulot muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Future<void> deleteProduct({required String docId}) async {
    try {
      await _firestore.collection('products').doc(docId).delete();
      MyUtils.getMyToast(message: 'Mahsulot muvaffaqiyatli ochirildi!');
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Future<void> updateProduct({required ProductModel productModel}) async {
    try {
      await _firestore
          .collection('products')
          .doc(productModel.productId)
          .update(productModel.toJson());

      MyUtils.getMyToast(message: 'Mahsulot muvaffaqiyatli yangilandi');
    } on FirebaseException catch (error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

  Stream<List<ProductModel>> getProduct({required String categoryId}) async* {
    if(categoryId.isEmpty){
       yield* _firestore.collection('products').snapshots().map((event) =>
        event.docs.map((doc) => ProductModel.fromJson(doc.data())).toList());
    } else {
      yield* _firestore.collection('products').where('categoryId', isEqualTo: categoryId).snapshots().map((event) =>
        event.docs.map((doc) => ProductModel.fromJson(doc.data())).toList());
    }
   
  }
}
