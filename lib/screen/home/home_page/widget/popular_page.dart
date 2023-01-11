import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/utils/my_utils.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.2,
        width: width(context),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              height: height(context)*0.2,
              width: width(context)*0.4,
              decoration: BoxDecoration(
              color:const Color(0xFFDEE6E3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)  
              ),
              
            );
          }),
          separatorBuilder: (context, index) {
            return SizedBox(width: width(context) * 0.05);
          },
        ));
    
  }
}
