import 'package:challenge_2/core/data/models/products_model.dart';
import 'package:challenge_2/core/data/reposotories/get_products_repository.dart';
import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/core/enums/operation_type.dart';
import 'package:challenge_2/core/services/base_controller.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends BaseController {
  List<ProductsModel> productsList = <ProductsModel>[];
  RxList<String> categoryList = <String>[].obs;
  TextEditingController controllerr = TextEditingController();
  RxList<ProductsModel> filteredProductsList = <ProductsModel>[].obs;
  bool toastShown = false;

  @override
  void onInit() {
    getAllproducts('All');
    super.onInit();
  }

  void search(String query) {
    filteredProductsList.value = productsList
        .where((element) =>
            element.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (filteredProductsList.isEmpty && !toastShown) {
      FocusManager.instance.primaryFocus?.unfocus();
      CustomToast.showMessage(
        message: "No Results found",
        messageType: MessageType.REJECTED,
      );
    }

    toastShown = filteredProductsList.isEmpty;
  }

  void getAllproducts(String category) {
    runLoadingFutureFunction(
        operationType: OperationType.PRODUCTS,
        function: getProductsRepository().getAll(category: category).then(
          (value) {
            value.fold(
              (l) {
                CustomToast.showMessage(
                  message: l,
                  messageType: MessageType.REJECTED,
                );
              },
              (r) {
                productsList.addAll(r);
                // filteredProductsList.assignAll(r);
              },
            );
          },
        ));
  }
}
