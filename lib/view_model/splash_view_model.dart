import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  int pageIndex = 0;

  void changeIndexPage(context,{required int newPageIndex}) {
    if(pageIndex < 2){
      pageIndex += newPageIndex;
   } else {
     pageIndex = 2;
   }
     
      notifyListeners();
  
  }

}
