import 'package:flutter/material.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.126,
        width: width(context),
        child: StreamBuilder<List<CategoryModel>>(
          stream: Provider.of<CategoriesViewModel>(context).listenCategories(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              List<CategoryModel> categories = snapshot.data!;
              return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Container(
                      height: height(context) * 0.09,
                      width: width(context) * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(categories[index].icon),
                      ),
                    ),
                    SizedBox(height: height(context)*0.005),
                    Text(categories[index].categoryName)
                  ],
                );
              }),
              separatorBuilder: (context, index) {
                return SizedBox(width: width(context) * 0.03);
              },
            );
          } else {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }
        ));
  }
}
