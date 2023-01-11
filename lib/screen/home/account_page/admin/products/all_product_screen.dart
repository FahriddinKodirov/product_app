import 'package:flutter/material.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRoute.addProductPage);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<ProductViewModel>(
        builder:(context, viewModel, child) {
          return ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  ProductModel product = viewModel.products[index];
                  return ListTile(
                    title: Text(product.productName),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoute.updateProductPage, arguments: {
                                      'products':product
                                    });
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                Provider.of<ProductViewModel>(context,
                                        listen: false)
                                    .deleteProduct(product.productId);
                                print("DELETING ID:${product.productId}");
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              );
        }, ),
    );
  }
}