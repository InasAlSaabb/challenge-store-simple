import 'package:bot_toast/bot_toast.dart';
import 'package:challenge_2/core/data/models/products_model.dart';
import 'package:challenge_2/core/data/reposotories/get_products_repository.dart';
import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/core/enums/operation_type.dart';
import 'package:challenge_2/core/services/base_controller.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/main_view/cart_view/cart_view.dart';
import 'package:challenge_2/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetailsController extends BaseController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  ProductsDetailsController({required ProductsModel model}) {
    product = model;
    //first
  }
  void editProduct({
    required String title,
    required double price,
    required String description,
    String? image,
    String? category,
  }) {
    runLoadingFutureFunction(
      operationType: OperationType.EDITING,
      function: getProductsRepository()
          .editProduct(
        category: category ?? "",
        description: description,
        image: image ?? "",
        price: price,
        title: title,
      )
          .then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              CustomToast.showMessage(
                  message: "Updated successfully ",
                  messageType: MessageType.SUCCESS);
              // getAllproducts(category ?? "");
            },
          );
        },
      ),
    );
  }

  void deleteProduct({
    required int id,
  }) {
    runFullLoadingFutureFunction(
      type: OperationType.DELETING,
      function: getProductsRepository()
          .deleteProduct(
        id: id,
      )
          .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          CustomToast.showMessage(
              message: "deleted successfully ",
              messageType: MessageType.SUCCESS);
          Get.back(closeOverlays: true);
        });
      }),
    );
  }

  ProductsModel product = ProductsModel();
  RxInt count = 1.obs;
  void changeCount(bool increase) {
    if (increase) {
      count++;
    } else {
      if (count > 1) count--;
    }
  }

  double calcTotal() {
    return (count.value * product.price!);
  }

  void addToCart() {
    cartService.addToCart(
        product: product,
        count: count.value,
        afterAdd: () {
          Get.find<HomeController>().cartCount.value += count.value;
          CustomToast.showMessage(message: "addd succesfully");
          // Get.to(CartView());
        });
  }
}
