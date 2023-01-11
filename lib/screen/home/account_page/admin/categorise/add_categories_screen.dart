import 'package:flutter/material.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';

class AddCategoriesPage extends StatelessWidget {
  const AddCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Column(children: [
        IconButton(onPressed: () {
           CategoryModel categoryModel = CategoryModel(
            categoryId: '', 
            categoryName: 'computer', 
            description: 'sifatiga gap yo', 
            createdAt: DateTime.now().toString(), 
            icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJxTwmWKVn0lm2bS7ZfNwY7bQvsUT8HrJWpg&usqp=CAU',
            );
           Provider.of<CategoriesViewModel>(context,listen: false).addCategory(categoryModel);
        }, icon: const Icon(Icons.add))
      ],),
    );
  }
}