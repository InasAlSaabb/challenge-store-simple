import 'package:challenge_2/ui/views/main_view/productt_view/product_view.dart';
import 'package:challenge_2/ui/views/main_view/home_view/home_view.dart';
import 'package:challenge_2/ui/views/main_view/main_view_controller.dart';
import 'package:challenge_2/ui/views/main_view/main_view_widget/bottom_navigation_widget.dart';
import 'package:challenge_2/ui/views/main_view/cart_view/cart_view.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_drawer.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainViewController controller = Get.put(MainViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: CustomDrawer(
          drawerWidth: screenWidth(2),
        ),
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: [
                ProductView(),
                HomeView(),
                CartView(),
              ],
            ),
            Obx(
              () => PositionedDirectional(
                bottom: 0,
                child: BottomNavigationWidget(
                  bottomNavigationEnum: controller.selected.value,
                  onTap: (selectedEnum, pageNumber) {
                    controller.navigateToPage(selectedEnum);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
