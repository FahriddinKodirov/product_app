import 'package:flutter/material.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:provider/provider.dart';

class UpdateCategoriestPage extends StatelessWidget {
  final CategoryModel categoryModel;

  const UpdateCategoriestPage({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Categories'),
      ),
      body: Column(
        children: [
          IconButton(onPressed: (){
            CategoryModel categoryMode = CategoryModel(
              categoryId: categoryModel.categoryId, 
              categoryName: 'muzlatkich', 
              description: categoryModel.description, 
              createdAt: categoryModel.createdAt, 
              icon: categoryModel.icon
              );
           Provider.of<CategoryModel>(context, listen: false).updateCategory(categoryMode);
            

          }, icon: const Icon(Icons.edit))
        ],),
    );
  }
}