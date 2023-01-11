import 'package:flutter/material.dart';
import 'package:products_app/utils/my_route.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: Column( 
        children: [
          ListTile(
            title: const Text('Products'),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.allProductPage);
            },
          ),
          ListTile(
            title: const Text('Categories'),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.allCategoriesPage);
            },
          ),
          
        ],),
    );
  }
}