import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:products_app/screen/home/search_page/widget/search_all_categories.dart';
import 'package:products_app/utils/my_icons.dart';

class MyUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );
}

InputDecoration getInputDecoration(
    {required IconData icon, required String word, required Widget eye}) {
  return InputDecoration(
    suffixIcon: word == 'Password' || word == 'Confirm' ? eye : null,
    prefixIcon: Icon(
      icon,
      color: Colors.black54,
    ),
    hintText: word,
    labelStyle:const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide:const BorderSide(
        width: 1,
        color: Colors.black54,
      ),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(width: 1, color: Colors.black)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide:const BorderSide(width: 1, color: Colors.black),
    ),
  );
}

InputDecoration getInputDecorationTwo({required String label}) {
  return InputDecoration(
    labelText: label,
    labelStyle:const TextStyle(color: Colors.black, fontSize: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}

back(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.058,
    width: MediaQuery.of(context).size.height * 0.09,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.05)),
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: SvgPicture.asset(MyIcons.left),
    ),
  );
}

searchHeaderPage({required String header, required String iconOne,required String iconTwo,isTrue}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        header,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      InkWell(
      onTap: () {
        isTrue = !isTrue;
      },  
        child: isTrue?SvgPicture.asset(iconOne):SvgPicture.asset(iconTwo)),
    ],
  );
}

gridWiew(
  { required var categoryLenth,
    required var height,
    required var width,
    required var count,
    required var extent,
    required var search,
    }) {
  return SizedBox(
      height: height,
      width: width,
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
              direction:  DismissDirection.endToStart,
              key: Key(index.toString()),
              background: Container(
                decoration: BoxDecoration(
                  color:const Color(0xfffbd1d8),
                  borderRadius: BorderRadius.circular(20)
                ),
                alignment: Alignment.centerRight, 
                padding: EdgeInsets.only(right: width*0.1),             
                child:const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 32,
                ),
            ), 
              child: search
              );
            
          })));
}

notFounPage(
    {context, required String wordLineOne, required String wordLineTwo}) {
  return Column(
    children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.11),
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
                color:const Color(0xFFE1F4F1),
                borderRadius: BorderRadius.circular(20)),
            child:const Center(
                child: Text(
              '🥵',
              style: TextStyle(fontSize: 20),
            )),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Text(
            wordLineOne,
            style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.004),
          Text(
            wordLineTwo,
            style:const TextStyle(color: Colors.black45),
          ),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
    ],
  );
}

check(context,{required String word,required String money,required Color myColor}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(word),
        Text(
          '\$ $money',
          style: TextStyle(
            fontSize: 22,
            color: myColor
          ),
        )
      ],
    ),
  );
}

class MyIndicator {
  static List<double> indexThree =
   [
   14,
   38,
   60
  ];

  static List<double> indexTwo =
   [
   38,
   60,
   38
  ];

  static List<double> indexOne =
   [
   60,
   14,
   14
  ];

  static List indexIndecator = [
    indexOne,
    indexTwo,
    indexThree
  ];
  
}

height(context)=> MediaQuery.of(context).size.height;
width(context)=> MediaQuery.of(context).size.width;


