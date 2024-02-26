import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_2/core/translation/app_translation.dart';
import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_button.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/check_out/check_out_view.dart';
import 'package:challenge_2/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsetsDirectional.all(screenWidth(20)),
        child: SizedBox(
          height: screenHieght(1),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text(
                "Cart",
                style: TextStyle(
                    fontSize: screenWidth(13), fontWeight: FontWeight.bold),
              ),
              20.ph,
              Obx(
                () {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: screenHieght(4),
                        width: screenWidth(1.2),
                        decoration: BoxDecoration(
                            color: AppColors.mainWhiteColor,
                            border: Border.all(
                                color: AppColors.mainGrey, width: 2)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.removeFromCart(
                                        controller.cartList[index]);
                                  },
                                  child: Icon(
                                    Icons.backspace,
                                    color: AppColors.mainRedColor,
                                    size: screenWidth(14),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      CachedNetworkImage(
                                        width: screenWidth(6),
                                        height: screenHieght(7),
                                        imageUrl: controller
                                            .cartList[index].product!.image!,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      SizedBox(
                                        width: screenWidth(25),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.cartList[index]
                                                      .product!.title ??
                                                  '',
                                              softWrap: true,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: screenWidth(21),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            10.ph,
                                            Row(
                                              children: [
                                                Text(
                                                  tr("key_price"),
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.fillColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  '${controller.cartList[index].product!.price!}',
                                                  style: TextStyle(
                                                      fontSize: screenWidth(20),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            10.ph,
                                            Row(
                                              children: [
                                                Text(
                                                  tr("key_total"),
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.fillColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          screenWidth(20)),
                                                ),
                                                Text(
                                                  '${controller.cartList[index].total!.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenWidth(20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.changeCount(
                                      incress: false,
                                      model: controller.cartList[index],
                                    );
                                  },
                                  child: Text('-'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.fillColor,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    '${controller.cartList[index].count.toString()}',
                                    style: TextStyle(fontSize: screenWidth(10)),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.changeCount(
                                      model: controller.cartList[index],
                                      incress: true,
                                    );
                                  },
                                  child: Text('+'),
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      backgroundColor: AppColors.fillColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        color: AppColors.mainOrangeColor,
                        width: screenWidth(1),
                      );
                    },
                  );
                },
              ),
              20.ph,
              Obx(() {
                return Column(
                  children: [
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
                                fontSize: screenWidth(20))),
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
                                fontSize: screenWidth(20))),
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
                                fontSize: screenWidth(20))),
                        Text(
                          '      ${cartService.deliverFees.value.toStringAsFixed(2)} SP',
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
                                fontSize: screenWidth(20))),
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
                    20.ph,
                    CustomButton(
                      backgroundColor: AppColors.fillColor,
                      text: tr("key_placed_order"),
                      onPressed: () {
                        if (cartService.cartCount != 0) {
                          Get.off(CheckOutView());
                        } else {
                          CustomToast.showMessage(message: " cart is empty");
                        }
                      },
                    ),
                    20.ph,
                    Visibility(
                      visible: cartService.cartCount != 0,
                      child: InkWell(
                        onTap: () {
                          cartService.clearCart();
                        },
                        child: Text(
                          tr("key_empty"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.mainRedColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
