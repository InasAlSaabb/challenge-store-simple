import 'package:challenge_2/core/data/models/products_model.dart';
import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/core/translation/app_translation.dart';
import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/cta_button.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_blur.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_form.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showTaskBottomSheet({
  ProductsModel? productsModel,
  required TextEditingController titleController,
  required TextEditingController priceController,
  required TextEditingController descriptionController,
  required Function(ProductsModel?) saveOnTap,
  Function? cancelOnTap,
  Function? deleteOnTap,
  bool editMode = false,
}) {
  // TimeOfDay? selectedStartTime;

  if (ProductsModel != null) {
    titleController.text = productsModel!.title!;
    priceController.text = productsModel.price.toString();
    descriptionController.text = productsModel.description!;
    // if (ProductsModel.details != null) detailsController.text = ProductsModel.details!;
    // if (repeatEnum.value == RepeatEnum.OneTime && ProductsModel.date != null) {
    //   dateController.text = baseDateFormat.format(ProductsModel.date!);
    // }
    // startTime?.value = ProductsModel.startTime!;
    // DateTime dateStartTime = DateFormat("Hms").parse(ProductsModel.startTime!);
    // selectedStartTime = TimeOfDay.fromDateTime(dateStartTime);
  }

  final GlobalKey<FormState> taskFormKey = GlobalKey<FormState>();

  Get.bottomSheet(
    WillPopScope(
      onWillPop: () {
        titleController.text = "";
        priceController.text = "";
        descriptionController.text = "";
        //?
        return Future.value(true);
      },
      child: CustomPopupWithBlurWidget(
        customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20),
              topEnd: Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: AppColors.mainblack,
            ),
          ),
          child: Form(
            key: taskFormKey,
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: screenWidth(25),
                vertical: screenWidth(25),
              ),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: screenHieght(50),
                ),
                CustomTextFormField(
                  controller: titleController,
                  hintText: tr("key_title"),
                  fillColor: AppColors.fillColor,
                  hintTextColor: AppColors.mainOrangeColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr('validator_empty_error');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHieght(
                    50,
                  ),
                ),
                CustomTextFormField(
                  controller: priceController,
                  hintText: tr("Price"),
                  fillColor: AppColors.fillColor,
                  hintTextColor: AppColors.mainWhiteColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr('validator_empty_error');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHieght(
                    50,
                  ),
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  hintText: tr("des"),
                  fillColor: AppColors.fillColor,
                  hintTextColor: AppColors.mainWhiteColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr('validator_empty_error');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHieght(
                    50,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CtaButton(
                      onTap: () {
                        cancelOnTap == null ? Get.back() : cancelOnTap();
                      },
                      title: "Cancel",
                      buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                      width: screenWidth(
                        3,
                      ),
                      height: screenWidth(
                        9,
                      ),
                      borderColor: AppColors.mainRedColor,
                      fillColor: AppColors.fillColor,
                      textColor: AppColors.fillGreyColor,
                    ),
                    CtaButton(
                      onTap: () {
                        if (taskFormKey.currentState!.validate()) {
                          saveOnTap(productsModel != null && editMode
                              ? ProductsModel(
                                  id: productsModel.id,
                                  description: productsModel.description,
                                  price: productsModel.price,
                                  title: productsModel.title,
                                )
                              : ProductsModel(
                                  description: productsModel!.description!,
                                  price: productsModel.price,
                                  title: productsModel.title,
                                ));
                        } else {
                          CustomToast.showMessage(
                            message: tr("validator_general_error"),
                            messageType: MessageType.INFO,
                          );
                        }
                      },
                      title:
                          editMode && ProductsModel != null ? "Update" : "Save",
                      buttonTypeEnum: ButtonTypeEnum.CUSTOM,
                      width: screenWidth(
                        3,
                      ),
                      height: screenWidth(
                        9,
                      ),
                      borderColor: AppColors.mainGreenColor,
                      fillColor: AppColors.mainBlueColor,
                      textColor: AppColors.mainWhiteColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
    isScrollControlled: true,
  );
}
