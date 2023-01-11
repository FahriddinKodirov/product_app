import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/data/models/category_model.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class SaerchAllCategories extends StatelessWidget {
  final bool isTrue;
  final List categoryModel;
  final int categoryLenth;
  final double height1;
  final double width1;
  final int count;
  final double extent;

  const SaerchAllCategories({
    super.key,
    required this.isTrue,
    required this.categoryModel,
    required this.categoryLenth,
    required this.height1,
    required this.width1,
    required this.count,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height1,
        width: width1,
        child: GridView.builder(
            itemCount: categoryLenth,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                mainAxisSpacing: 14,
                crossAxisSpacing: 20,
                mainAxisExtent: extent),
            itemBuilder: ((context, index) {
              return Dismissible(
                  behavior: HitTestBehavior.translucent,
                  direction: DismissDirection.endToStart,
                  key: Key(index.toString()),
                  background: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfffbd1d8),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: width1 * 0.1),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 32,
                    ),
                  ),
                  child: Container(
                    height: height(context) * 0.2,
                    width: width1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Image.network(
                          categoryModel[index].icon,
                          width: 100,
                        ),
                        SizedBox(height: height(context) * 0.01),
                        isTrue
                            ? fruitsItemsOne(categoryModel[index].categoryName)
                            : fruitsItemsTwo(categoryModel[index].categoryName,
                                width(context), height(context))
                      ],
                    ),
                  ));
            })));
  }

  fruitsItemsOne(name) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 20)),
        const Text('112 Items',
            style: TextStyle(fontSize: 14, color: Colors.black26)),
      ],
    );
  }

  fruitsItemsTwo(name, width, height) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.1),
          child: Text(name, style: const TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.178, top: height * 0.004),
          child: const Text('112 Items',
              style: TextStyle(fontSize: 14, color: Colors.black26)),
        ),
      ],
    );
  }
}
