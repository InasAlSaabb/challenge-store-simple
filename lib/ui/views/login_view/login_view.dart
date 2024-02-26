import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_button.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_form.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_text.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsetsDirectional.only(start: 20, end: 20, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Icon(Icons.arrow_back),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 30, bottom: 10),
                      child: Text(
                        'Welcome back 👋',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.fillColor),
                      ),
                    ),
                    Text(
                      'We happy to see you again. To use your account, you should login first',
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 34, 34, 34)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 33, bottom: 35),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: [
                                    AppColors.fillColor,
                                    AppColors.mainGrey,
                                    AppColors.mainBlueColor
                                  ])),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(155, 55),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onPressed: () {},
                                child: CustomText(
                                  text: "Username",
                                  textAlign: TextAlign.start,
                                  textType: TextStyleType.BODY,
                                  fontSize: screenWidth(30),
                                ),
                              ),
                            ),

                            Container(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(155, 55),
                                    backgroundColor: Colors.grey[200],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                onPressed: () {},
                                child: CustomText(
                                  text: "Py Phone Number",
                                  textAlign: TextAlign.start,
                                  fontSize: screenWidth(30),
                                  textType: TextStyleType.BODY,
                                ),
                              ),
                            ),
                            //
                            //
                          ]),
                    ),
                    CustomText(
                      text: "Username",
                      textAlign: TextAlign.start,
                      textType: TextStyleType.BODY,
                      fontSize: screenWidth(20),
                    ),
                    screenHieght(60).ph,
                    CustomTextFormField(
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.fillColor,
                        ),
                        hintText: "Enter Your username please",
                        controller: controller.emailController,
                        fillColor: AppColors.mainWhiteColor,
                        hintTextColor: AppColors.fillColor),
                    screenHieght(60).ph,
                    CustomText(
                      text: "Password",
                      textAlign: TextAlign.start,
                      textType: TextStyleType.BODY,
                      fontSize: screenWidth(20),
                    ),
                    screenHieght(60).ph,
                    CustomTextFormField(
                      hintText: "password",
                      controller: controller.passwordController,
                      fillColor: AppColors.mainWhiteColor,
                      hintTextColor: AppColors.fillColor,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.fillColor,
                      ),
                    ),
                    screenHieght(60).ph,
                    CustomText(
                      text: "Forget Password?",
                      textAlign: TextAlign.start,
                      fontSize: screenWidth(20),
                      textType: TextStyleType.BODY,
                    ),
                    screenHieght(60).ph,
                    Obx(() {
                      return controller.isLoading
                          ? SpinKitThreeBounce(
                              color: AppColors.mainOrangeColor,
                            )
                          : Center(
                              child: CustomButton(
                                  text: "Login",
                                  backgroundColor: AppColors.fillColor,
                                  textColor: AppColors.mainWhiteColor,
                                  borderColor: AppColors.transparentColor,
                                  onPressed: () {
                                    controller.login();
                                  }),
                            );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
