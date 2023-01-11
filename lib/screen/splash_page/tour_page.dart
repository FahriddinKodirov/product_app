import 'package:flutter/material.dart';
import 'package:products_app/screen/splash_page/widget/widget_indicator.dart';
import 'package:products_app/screen/splash_page/widget/widget_picture.dart';
import 'package:products_app/screen/splash_page/widget/widget_sign.dart';
import 'package:products_app/screen/splash_page/widget/widget_text.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/utils/my_utils.dart';
import 'package:products_app/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {

  

   
  @override
  Widget build(BuildContext context) {
    int index = context.watch<SplashViewModel>().pageIndex;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SizedBox(
          height: height(context),
          width: width(context),
          child: Stack(
            children: [
              SizedBox(height: height(context), width: width(context), child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoute.authPage);
                },
                child: WidgetPicture(newPageIndex: index))),
              Positioned(
                  top: height(context) * 0.5,
                  child: Stack(children: [
                    Image.asset(MyImages.shape, width: width(context)),
                    Positioned(
                        top: height(context) * 0.1,
                        left: width(context) * 0.01,
                        child: SizedBox(
                            height: height(context) * 0.3,
                            width: width(context),
                            child: WidgetText(newPageIndex: index,))),
                    Positioned(
                      top: height(context) * 0.036,
                      left: width(context) * 0.36,
                      child: SizedBox(
                        height: height(context)*0.01,
                        width: width(context)*0.4,
                        child:  WidgetIndicator(newPageIndex: index)),
                    )
                  ])),
              Positioned(
                  left: width(context) * 0.25,
                  top: height(context) * 0.82,
                  child: const WidgetSign()),
             
            ],
          ),
        ),
      ),
    );
  }
}
