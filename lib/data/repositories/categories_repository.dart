import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/utils/my_utils.dart';

class CategoriesRepository {
  final FirebaseFirestore _firestore;

  CategoriesRepository({required FirebaseFirestore firebaseFirestore})
       :_firestore = firebaseFirestore;
    
 Future<void> addCategory({required CategoryModel categoryModel}) async {
  try {
    DocumentReference newCategory =
       await _firestore.collection('categories').add(categoryModel.toJson());
       await _firestore.collection('categories').doc(newCategory.id).update({
        'categoryId': newCategory.id,
       });
       MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch(error){
       MyUtils.getMyToast(message: error.message.toString());
   }
  }

  Future<void> deleteCategory({required String docId}) async {
    try {
      await _firestore.collection('categories').doc(docId).delete();
      MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch(error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }


Future<void> updateCategory({required CategoryModel categoryModel}) async {
  try {
    await _firestore
         .collection('categories')
         .doc(categoryModel.categoryId)
         .update(categoryModel.toJson());
        MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli yangilandi!");
  } on FirebaseException catch(error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
}
   Stream<List<CategoryModel>> getCategories() =>
      _firestore.collection('categories')
      .snapshots().map((event) => event.docs
      .map((doc) => CategoryModel.fromJson(doc.data()))
      .toList()
      );
}
