import 'package:flutter/material.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String productImage =
      "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png";
  String categoryId = '';
  String createAt = DateTime.now().toString();
  List<String> currencies = ['USD', 'SOM', 'RUBL'];
  String selectedCurrency = 'USD';

  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: getInputDecoration(
                    icon: Icons.accessibility_new, word: 'Count', eye: Container()),
              ),
              SizedBox(height: height(context) * 0.03),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: getInputDecoration(
                    icon: Icons.accessibility_new, word: 'Text', eye: Container()),
              ),
              SizedBox(height: height(context) * 0.03),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: getInputDecoration(
                    icon: Icons.accessibility_new,
                    word: 'Product Name',
                    eye: Container()),
              ),
              SizedBox(height: height(context) * 0.03),
              SizedBox(
                height: height(context) * 0.3,
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  maxLines: 20,
                  decoration: getInputDecoration(
                      icon: Icons.accessibility_new,
                      word: 'Description',
                      eye: Container()),
                ),
              ),
              SizedBox(height: height(context) * 0.03),
              ExpansionTile(
                title: Text(selectedCurrency.isEmpty
                    ? "Select  Currncy"
                    : selectedCurrency),
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(currencies[index]),
                        onTap: () {
                          setState(() {
                            selectedCurrency = currencies[index];
                          });
                        },
                      );
                    },
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    selectCategory((selectedCategory) {
                      categoryModel = selectedCategory;
                      categoryId = categoryModel!.categoryId;
                      setState(() { });
                     });
      
                  },
                  child: Text(categoryModel == null
                      ? 'Select Category'
                      : categoryModel!.categoryName)),
      
                ElevatedButton(onPressed: (){
                  ProductModel productModel = ProductModel(
                    productId: '', 
                    categoryId: categoryId, 
                    productName: nameController.text, 
                    price: int.parse(priceController.text), 
                    currency: selectedCurrency, 
                    description: descriptionController.text, 
                    count: countController.text, 
                    imageUrl: productImage, 
                    rate: 2);
      
                  Provider.of<ProductViewModel>(context,listen: false).addProduct(productModel);
      
                }, child: const Text('add product'))
            ],
          ),
        ),
      ),
    );
  }

  selectCategory(ValueChanged<CategoryModel> onCategorySelect) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
                height: height(context) * 0.6,
                width: width(context),
                child: StreamBuilder<List<CategoryModel>>(
                  stream:
                      Provider.of<CategoriesViewModel>(context, listen: false)
                          .listenCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      List<CategoryModel> categories = snapshot.data!;
                      return ListView(
                        children: List.generate(
                            categories.length,
                            (index) => ListTile(
                                  title: Text(categories[index].categoryName),
                                  onTap: () {
                                    onCategorySelect.call(categories[index]);
                                    Navigator.pop(context);
                                  },
                                )),
                      );
                    } else {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                  },
                )),
          );
        });
  }
}
