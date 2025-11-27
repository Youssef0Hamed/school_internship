import 'package:flutter/material.dart';

class Inicatorprovider extends ChangeNotifier {
  int currentindex = 0;
  int currentindexuser = 0;
  PageController pageController = PageController();
  bool show = false;


  void changeScreens(int index){
    currentindex = index;
    notifyListeners();
  }
  void changeScreensUsers(int index){
    currentindexuser = index;
    notifyListeners();
  }

  void showpass(){
    
    show = !show;
    notifyListeners();
  }
}