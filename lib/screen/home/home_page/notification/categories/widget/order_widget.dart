import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_app/utils/my_icons.dart';
import 'package:products_app/utils/my_utils.dart';

class OrderWidget extends StatelessWidget {
  final String header;
  final Color orderColor;
  const OrderWidget({super.key,required this.header,
                     required this.orderColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(left: width(context)*0.05,top: height(context)*0.02),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(header,style:const TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: width(context)*0.0,top: height(context)*0.02),
        child: Container(
            height: height(context)*0.125,
            width: width(context)*0.9,
            decoration: BoxDecoration(
            color: orderColor,
            borderRadius: BorderRadius.circular(20)  
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              SvgPicture.asset(MyIcons.apple,width: 100,),
              Padding(
                padding:  EdgeInsets.only(top: height(context)*0.01,right: width(context)*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Order 08/20/2021',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  Text('\$ 12.2',style: TextStyle(fontSize: 20,color:const Color(0XFF2EC158).withOpacity(0.8),),),
                  const Divider(thickness: 2,color: Colors.red),
                  const Text('On delivery to Yona’s Home',style: TextStyle(color: Colors.black45),)
                ],),
              )
            ],),
          ),
      )
    ],);
  }
}