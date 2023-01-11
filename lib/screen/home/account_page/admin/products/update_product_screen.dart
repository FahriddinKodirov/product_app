import 'package:flutter/material.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/data/models/product_model.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class UpdateProductPage extends StatefulWidget {
  final ProductModel products;

  const UpdateProductPage({super.key, required this.products});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final TextEditingController countController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String productImages =
      "https://www.pngitem.com/pimgs/m/183-1831803_laptop-collection-png-transparent-png.png";

  String categoryId = "";
  CategoryModel? categoryModel;
  List<String> currencies = ["USD", "SO'M", "RUBL", "TENGE"];
  String selectedCurrency = "USD";

  @override
  void initState() {
    countController.text = widget.products.count;
    priceController.text = widget.products.price.toString();
    nameController.text = widget.products.productName;
    rateController.text = widget.products.rate.toString();
    descriptionController.text = widget.products.description;
    categoryId = widget.products.categoryId;
    selectedCurrency = widget.products.currency;
    super.initState();
  }

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
                    icon: Icons.accessibility_new,
                    word: 'Count',
                    eye: Container()),
              ),
              SizedBox(height: height(context) * 0.03),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: getInputDecoration(
                    icon: Icons.accessibility_new,
                    word: 'Text',
                    eye: Container()),
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
                      setState(() {});
                    });
                  },
                  child: Text(categoryModel == null
                      ? 'Select Category'
                      : categoryModel!.categoryName)),
              ElevatedButton(
                  onPressed: () {
                    ProductModel productModel = ProductModel(
                        productId: widget.products.categoryId,
                        categoryId: categoryId,
                        productName: nameController.text,
                        price: int.parse(priceController.text),
                        currency: selectedCurrency,
                        description: descriptionController.text,
                        count: countController.text,
                        imageUrl: productImages,
                        rate: int.parse(rateController.text));

                    Provider.of<ProductViewModel>(context, listen: false)
                        .updateProduct(productModel);
                  },
                  child: const Text('add product'))
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
