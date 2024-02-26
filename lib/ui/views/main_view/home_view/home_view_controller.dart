import 'package:challenge_2/core/data/models/products_model.dart';
import 'package:challenge_2/core/data/reposotories/get_category.dart';
import 'package:challenge_2/core/data/reposotories/get_products_repository.dart';
import 'package:challenge_2/core/enums/message_type.dart';
import 'package:challenge_2/core/enums/operation_type.dart';
import 'package:challenge_2/core/services/base_controller.dart';
import 'package:challenge_2/core/services/cart_services.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  RxList<ProductsModel> productsList = <ProductsModel>[].obs;
  RxList<String> categoryList = <String>[].obs;
  RxInt cartCount = 0.obs;
  String selectedcategory = "All";
  RxInt selectedIndex = 0.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    getAllproducts('All');
    getAllCategory();
    super.onInit();
  }

  void getAllproducts(String category) {
    selectedcategory = category;
    runLoadingFutureFunction(
        operationType: OperationType.PRODUCTS,
        function: category != "All"
            ? getProductsRepository()
                .getproductsbycategory(category: category)
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
                      productsList.clear();
                      //very import
                      productsList.addAll(r);
                    },
                  );
                },
              )
            : getProductsRepository().getAll(category: category).then(
                (value) {
                  value.fold(
                    (l) {
                      CustomToast.showMessage(
                        message: l,
                        messageType: MessageType.REJECTED,
                      );
                    },
                    (r) {
                      productsList.clear();
                      productsList.addAll(r);
                    },
                  );
                },
              ));
  }

  void getAllCategory() {
    runLoadingFutureFunction(
      operationType: OperationType.CATEGORY,
      function: getCategoryRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              categoryList.addAll(r);
            },
          );
        },
      ),
    );
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
              getAllproducts(category ?? "");
            },
          );
        },
      ),
    );
  }

  void addCart(ProductsModel product) {
    CartService().addToCart(
        count: 1,
        product: product,
        afterAdd: () {
          CustomToast.showMessage(
              message: 'Addeed', messageType: MessageType.SUCCESS);
          cartCount.value = CartService().getCartCount();
        });
  }
}
