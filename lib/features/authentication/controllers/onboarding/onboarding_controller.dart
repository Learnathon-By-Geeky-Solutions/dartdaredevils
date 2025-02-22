import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/login/login.dart';


class OnBoardingController extends GetxController{

  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  ///Update Current Index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;


  ///Jump to the specific dot selected Page
  void dotNavigationClick (index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }


  ///Update Current Index & Jump Next Page
  void nextPage(){
    if(currentPageIndex.value==2){
      Get.to(LoginScreen());
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }

  }

  ///Update Current Index & Jump Last Page
  void skipPage(){
    currentPageIndex.value=2;
    pageController.jumpToPage(2);
  }

}