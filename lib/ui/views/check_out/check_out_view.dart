import 'package:challenge_2/core/translation/app_translation.dart';
import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_button.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cartService.clearCart();
        Get.off(MainView());
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(17)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (screenWidth(23)).ph,
              Text(
                tr("key_succed"),
                style: TextStyle(
                    fontSize: screenWidth(10), fontWeight: FontWeight.bold),
              ),
              20.ph,
              Row(
                children: [
                  Text(
                    tr("key_order"),
                    style: TextStyle(
                        color: AppColors.fillColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(19)),
                  ),
                  Text(
                    '    #1239100',
                    style: TextStyle(
                        color: AppColors.mainblack,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(19)),
                  )
                ],
              ),
              20.ph,
              Row(
                children: [
                  Text(
                    tr("key_number_pro"),
                    style: TextStyle(
                        color: AppColors.fillColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(19)),
                  ),
                  Text(
                    '    ${cartService.cartCount}',
                    style: TextStyle(
                        color: AppColors.mainblack,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(19)),
                  ),
                ],
              ),
              30.ph,
              Container(
                color: AppColors.fillColor,
                height: 3,
                width: screenWidth(1),
              ),
              30.ph,
              Row(
                children: [
                  Text(tr("key_sub_total"),
                      style: TextStyle(
                          color: AppColors.fillColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(19))),
                  Text(
                    '                  ${cartService.subTotal.value.toStringAsFixed(2)}  SP',
                    style: TextStyle(
                      fontSize: screenWidth(20),
                      color: AppColors.mainblack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              10.ph,
              Container(
                color: AppColors.placeholderGreyColor,
                height: 3,
                width: screenWidth(1),
              ),
              30.ph,
              Row(
                children: [
                  Text(tr("key_tax"),
                      style: TextStyle(
                          color: AppColors.fillColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(19))),
                  Text(
                    '                              ${cartService.tax.value.toStringAsFixed(2)}  SP',
                    style: TextStyle(
                      fontSize: screenWidth(20),
                      color: AppColors.mainblack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              10.ph,
              Container(
                color: AppColors.placeholderGreyColor,
                height: 3,
                width: screenWidth(1),
              ),
              30.ph,
              Row(
                children: [
                  Text(tr("key_delivary_fees"),
                      style: TextStyle(
                          color: AppColors.fillColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(19))),
                  Text(
                    '      ${cartService.deliverFees.value.toStringAsFixed(2)}  SP',
                    style: TextStyle(
                      fontSize: screenWidth(20),
                      color: AppColors.mainblack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              10.ph,
              Container(
                color: AppColors.placeholderGreyColor,
                height: 3,
                width: screenWidth(1),
              ),
              30.ph,
              Row(
                children: [
                  Text(tr("key_total"),
                      style: TextStyle(
                          color: AppColors.mainRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(19))),
                  Text(
                    '                      ${cartService.total.value.toStringAsFixed(2)}  SP',
                    style: TextStyle(
                      fontSize: screenWidth(20),
                      color: AppColors.mainblack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              30.ph,
              Container(
                color: AppColors.fillColor,
                height: 3,
                width: screenWidth(1),
              ),
              Spacer(),
              CustomButton(
                backgroundColor: AppColors.fillColor,
                text: tr("key_continue"),
                onPressed: () {
                  cartService.clearCart();
                  Get.off(MainView());
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
