import 'package:challenge_2/core/enums/bottom_Navigation.dart';
import 'package:challenge_2/core/services/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewController extends BaseController {
  final selected = BottomNavigationEnum.HOME.obs;
  final pageController = PageController(initialPage: 1);

  void navigateToPage(BottomNavigationEnum page) {
    final pageNumber = getPageNumber(page);
    pageController.animateToPage(
      pageNumber,
      duration: Duration(microseconds: 500),
      curve: Curves.easeInCirc,
    );
    selected.value = page;
  }

  int getPageNumber(BottomNavigationEnum page) {
    switch (page) {
      case BottomNavigationEnum.PRODUCTS:
        return 0;
      case BottomNavigationEnum.HOME:
        return 1;
      case BottomNavigationEnum.CART:
        return 2;

      default:
        return 1; // Default page is HomeView
    }
  }
}
