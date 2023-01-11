import 'package:flutter/material.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_utils.dart';

class ShowDilogPage extends StatelessWidget {
  const ShowDilogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          anchorPoint: Offset(10, 10),
          context: context,
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Image.asset(MyImages.shape),
                    Positioned(
                        top: height(context) * 0.1,
                        left: width(context) * 0.2,
                        child:const Center(
                            child: Text(
                          'Karta',
                          style: TextStyle(fontSize: 100),
                        )))
                  ],
                ),
              ],
            );
          },
        );
      },
      child: Container(
          height: height(context) * 0.055,
          width: height(context) * 0.2,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(30)),
          child:const Center(child: Text('Yonas Home'))),
    );
  }
}
