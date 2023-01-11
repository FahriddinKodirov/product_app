import 'package:flutter/cupertino.dart';
import 'package:products_app/utils/my_text.dart';
import 'package:products_app/utils/my_utils.dart';

class WidgetText extends StatelessWidget {
  late int newPageIndex;
  WidgetText({super.key, required this.newPageIndex});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          index = newPageIndex;
          return Column(
            children: [
              Center(
                child: Text(MyText.listOne[newPageIndex],
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w500)),
              ),
              Center(
                child: Text(MyText.listTwo[newPageIndex],
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: height(context) * 0.02,
              ),
              Center(
                child: Text(MyText.listThree[newPageIndex],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: height(context) * 0.003),
              Center(
                child: Text(MyText.listFour[newPageIndex],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              SizedBox(height: height(context) * 0.003),
              Center(
                child: Text(MyText.listFive[newPageIndex],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ],
        );
    });
  }
}
