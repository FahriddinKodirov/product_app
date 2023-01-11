import 'package:flutter/cupertino.dart';
import 'package:products_app/utils/my_picture.dart';
import 'package:products_app/utils/my_route.dart';


class WidgetPicture extends StatelessWidget {
   late int newPageIndex;

  WidgetPicture({super.key, required this.newPageIndex});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          index = newPageIndex;
          return Column(
            children: [
              Image.asset(MyPicture.picture[newPageIndex]),
              
            ],
          );
        });
  }
}
