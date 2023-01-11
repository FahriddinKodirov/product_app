import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/data/repositories/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepositories productRepositories;

  ProductViewModel({required this.productRepositories}){
    listenProducts('');
  }

  late StreamSubscription subscription;
  List<ProductModel> products = [];

  listenProducts(String categoryId) async {
    subscription = productRepositories
        .getProduct(categoryId: categoryId)
        .listen((allProduct) {
          print("ALL PRODUCTS LENGTH-----------------:${allProduct.length}");
      products = allProduct;
      notifyListeners();
    });
  }

//  ---------------------------------------------------------------------
  addProduct(ProductModel productModel) =>
      productRepositories.addProduct(productModel: productModel);

  updateProduct(ProductModel productModel) =>
      productRepositories.updateProduct(productModel: productModel);

  deleteProduct(String docId) =>
      productRepositories.deleteProduct(docId: docId);

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
