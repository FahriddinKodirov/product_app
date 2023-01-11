import 'package:flutter/material.dart';
import 'package:products_app/utils/my_images.dart';
import 'package:products_app/utils/my_utils.dart';

class ClaimPage extends StatelessWidget {
  const ClaimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(left: height(context) *0.029),
              height: height(context) *0.2,
              width: width(context),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder:(context, index) {
                  return Stack(
                    children: [
                      Image.asset(MyImages.newMember,fit: BoxFit.fitWidth,),
                      Positioned(
                      top: height(context) *0.03,
                      left: width(context) *0.06,
                      child: const Text('New Member',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),)),
                      Positioned(
                      top: height(context) *0.06,
                      left: width(context) *0.06,
                      child:const Text('discount')),
                      Positioned(
                      top: height(context) *0.08,
                      left: width(context) *0.06,
                      child:const Text('40%',style: TextStyle(fontSize: 33,fontWeight: FontWeight.w700))),
                      Positioned(
                      top: height(context) *0.14,
                      left: width(context) *0.06, 
                      child: Container(
                        height: height(context) *0.034,
                        width: width(context) *0.22,
                        decoration: BoxDecoration(
                         color: Colors.green[400],
                         borderRadius: BorderRadius.circular(25) 
                        ),
                        child:const Center(child: Text('claim now',style: TextStyle(color: Colors.white,fontSize: 12),)),
                      )),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width(context) *0.1,);
                },
                ),
            );
  }
}