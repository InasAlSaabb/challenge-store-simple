import 'package:challenge_2/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    this.drawerBackgroundColor,
    required this.drawerWidth,
    this.drawerheight,
  });
  final double? drawerWidth;
  final double? drawerheight;
  final Color? drawerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: drawerheight,
      width: drawerWidth,
      color: drawerBackgroundColor ?? AppColors.mainWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              // onPressed: () {
              //   SharedPrefrenceRepostory().clearTokenInfo();
              //   Get.off(SplashSceenView());
              // },
              icon: Icon(Icons.logout),
            ),
            Text('Options 1'),
            Text('Options 2'),
          ],
        ),
      ),
    );
  }
}
