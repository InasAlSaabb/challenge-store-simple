import 'package:challenge_2/core/enums/bottom_Navigation.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;
  BottomNavigationWidget(
      {Key? key, required this.bottomNavigationEnum, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          //   decoration: BoxDecoration(borderRadius: BorderRadius.only()),
          color: AppColors.mainWhiteColor,
          width: screenHieght(1),
          height: screenHieght(10),
        ),
        Positioned(
          // bottom: 0,
          // bottom: size.width * 0.05,
          // left: size.width * 0.05,
          // right: size.width * 0.05,
          bottom: screenWidth(300),
          right: 7,
          left: 7,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 10,
              ),
              navItem(
                  imageName: 'products-svgrepo-com',
                  text: '',
                  isSelected: widget.bottomNavigationEnum ==
                      BottomNavigationEnum.PRODUCTS,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.PRODUCTS, 0);
                  },
                  size: Get.size),
              SizedBox(
                width: 150,
              ),
              navItem(
                  imageName: 'home-svgrepo-com',
                  text: '',
                  isSelected:
                      widget.bottomNavigationEnum == BottomNavigationEnum.HOME,
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 1);
                  },
                  size: Get.size),
              SizedBox(
                width: 150,
              ),
              Stack(
                children: [
                  navItem(
                    imageName: 'cart-svgrepo-com',
                    text: '',
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.CART,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.CART, 2);
                    },
                    size: Get.size,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Obx(() => cartService.cartCount.value > 0
                        ? Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${cartService.cartCount.value}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
    required Size size,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/$imageName.svg',
            color: isSelected ? AppColors.fillColor : AppColors.mainblack,
            width: 30,
          ),
          SizedBox(
            height: screenWidth(60),
          ),
          Text(
            text,
            // style: TextStyle(
            //   color:
            //       isSelected ? AppColors.mainOrangeColor : AppColors.mainGrey,
            // ),
          )
        ],
      ),
    );
  }
}
