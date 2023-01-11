import 'package:flutter/material.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/screen/home/account_page/admin/categorise/update_categories_screen.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Category'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoute.addCategoriesPage);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<List<CategoryModel>>(
          stream: Provider.of<CategoriesViewModel>(context).listenCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              List<CategoryModel> categories = snapshot.data!;
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return ListTile(
                    title: Text(category.categoryName),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_) => UpdateCategoriestPage(categoryModel: category)));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                Provider.of<CategoriesViewModel>(context,
                                        listen: false)
                                    .deleteCategory(category.categoryId);
                                print("DELETING ID:${category.categoryId}");
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          },
        ));
  }
}
