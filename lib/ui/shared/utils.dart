import 'package:bot_toast/bot_toast.dart';
import 'package:challenge_2/core/data/reposotories/shared_prefernces.dart';
import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/services/cart_services.dart';
import 'custom_widgets/custom_toast.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isPassword(String value) {
  RegExp regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

bool isName(String value) {
  RegExp regExp = new RegExp(r'^[a-zA-Z]+(([,. -][a-zA-Z ])?[a-zA-Z]*)*$');

  return regExp.hasMatch(value);
}

bool isMobileNo(String value) {
  RegExp regExp = new RegExp(r'^[+]?[0-9]{10,13}$');

  return regExp.hasMatch(value);
}

bool isAddress(String value) {
  RegExp regExp = new RegExp(r'^[a-zA-Z0-9\s,\-]*$');
  return regExp.hasMatch(value);
}

bool isAge(int value) {
  if (value > 18 && value < 80)
    return true;
  else
    return false;
}

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}

SharedPrefrenceRepostory get storage => Get.find<SharedPrefrenceRepostory>();
// CartService get cartService => Get.find<CartService>();

// get get.size.width();
Future claunchUrl(Uri url) async {
  if (!await claunchUrl(
    url,
    // mode: LaunchMode.externalApplication,
  )) {
    CustomToast.showMessage(
        message: 'cant launch url', messageType: MessageType.REJECTED);
  }
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.mainback.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenHieght(4),
        child: Lottie.asset('assets/animation_lk5m3vwl.json', height: 100),
      );
    });
double get taxAmount => 0.18;
double get deliverAmount => 0.1;
CartService get cartService => Get.find<CartService>();
