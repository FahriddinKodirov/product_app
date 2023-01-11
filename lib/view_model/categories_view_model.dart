import 'package:flutter/cupertino.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/data/repositories/categories_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoriesRepository categoriesRepository;

  CategoriesViewModel({required this.categoriesRepository});

  Stream<List<CategoryModel>> listenCategories() => categoriesRepository.getCategories();

  addCategory(CategoryModel categoryModel) => 
       categoriesRepository.addCategory(categoryModel: categoryModel);
  
  updateCategory(CategoryModel categoryModel) => 
       categoriesRepository.updateCategory(categoryModel: categoryModel);
  
  deleteCategory(String docId) => 
       categoriesRepository.deleteCategory(docId: docId);
 
  //-----------------------------------------------------------------

}

