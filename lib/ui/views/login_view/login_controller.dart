import 'package:challenge_2/core/data/reposotories/user_repository.dart';
import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/core/services/base_controller.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:challenge_2/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../shared/utils.dart';

class LoginController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    {
      if (formKey.currentState!.validate()) {
        runFullLoadingFutureFunction(
            function: UserRepository()
                .Login(
                    email: emailController.text,
                    password: passwordController.text)
                .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                messageType: MessageType.REJECTED, message: l);
          }, (r) {
            storage.setTokenInfo(r);
            Get.off(MainView());
          });
        }));

        ;
      }
    }
  }
}
