import 'package:flutter/material.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_route.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  Future navigator() async { 
     const Duration(seconds: 3);
     Navigator.pushNamed(context, MyRoute.tourPage);
    }
  @override
  void initState() {
    navigator();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MyRoute.tourPage);
        },
        child: Image.asset(MyImages.splashPage)),
    );
  }
}