import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_colors.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

class WidgetSign extends StatelessWidget {
  final int index = 1;

  const WidgetSign({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: height(context) * 0.12,
            width: height(context) * 0.24,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                border: Border.all(color: const Color(0xFFBFD6E3)),
                borderRadius: BorderRadius.circular(height(context) * 0.1))),
        Positioned(
            top: height(context) * 0.01,
            left: width(context) * 0.02,
            child: InkWell(
              onTap: () {
                Provider.of<SplashViewModel>(context, listen: false)
                    .changeIndexPage(context,newPageIndex: index);
                
                
              },
              child: Container(
                  height: height(context) * 0.10,
                  width: height(context) * 0.22,
                  decoration: BoxDecoration(
                      gradient: gradientGreen(),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, -1),
                            spreadRadius: 1,
                            blurRadius: 4),
                      ],
                      color: const Color(0xFFFFFFFF),
                      borderRadius:
                          BorderRadius.circular(height(context) * 0.1)),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: SvgPicture.asset(MyIcons.right),
                  )),
            )),
      ],
    );
  }
}
