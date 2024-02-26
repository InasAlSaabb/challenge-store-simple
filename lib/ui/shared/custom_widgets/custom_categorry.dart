import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCat extends StatefulWidget {
  const CustomCat({
    super.key,
    required this.categoryName,
    required this.index,
  });
  final String categoryName;
  final int index;
  @override
  State<CustomCat> createState() => _CustomCatState();
}

class _CustomCatState extends State<CustomCat> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {
                controller.selectedIndex.value = widget.index;
                controller.getAllproducts(widget.categoryName);
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColors.mainGrey),
                    shape: BoxShape.rectangle,
                    color: controller.selectedIndex.value == widget.index
                        ? AppColors.fillColor
                        : AppColors.mainWhiteColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    widget.categoryName,
                    style: TextStyle(
                      fontSize: 20,
                      color: controller.selectedIndex.value == widget.index
                          ? AppColors.mainWhiteColor
                          : AppColors.mainblack,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
