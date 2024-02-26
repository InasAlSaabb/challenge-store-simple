import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_2/core/data/models/products_model.dart';
import 'package:challenge_2/core/translation/app_translation.dart';
import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_bottom_sheat.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:challenge_2/ui/views/product_details_view/products_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductsModel model;
  const ProductDetailsView({super.key, required this.model});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late ProductsDetailsController controller;

  @override
  void initState() {
    controller = Get.put(ProductsDetailsController(model: widget.model));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  controller.deleteProduct(id: controller.product.id!);
                },
                child: Icon(Icons.delete))
          ],
          backgroundColor: AppColors.fillColor,
          leading: InkWell(
            onTap: () {
              showTaskBottomSheet(
                productsModel: controller.product,
                editMode: true,
                titleController: controller.titleController,
                descriptionController: controller.descriptionController,
                priceController: controller.priceController,
                saveOnTap: (value) {
                  controller.editProduct(
                      title: value!.title!,
                      price: value.price!,
                      description: value.description!);

                  Get.back(closeOverlays: true);
                },
                cancelOnTap: () {
                  Get.back();
                },
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: AppColors.mainWhiteColor,
                ),
              ],
            ),
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth(15)),
              children: [
                (screenWidth(22)).ph,
                Text(
                  '${widget.model.title}',
                  style: TextStyle(
                      fontSize: screenWidth(20), fontWeight: FontWeight.bold),
                ),
                30.ph,
                CachedNetworkImage(
                  width: screenWidth(2),
                  height: screenHieght(5),
                  imageUrl: widget.model.image ?? "",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                30.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      tr("key_des"),
                      style: TextStyle(
                          color: AppColors.fillColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(17)),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 10,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                      itemBuilder: (context, _) => SizedBox(
                        width: 1,
                        height: 10,
                        child: Icon(
                          Icons.star,
                          color: AppColors.fillColor,
                        ),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                20.ph,
                Text(
                  '${widget.model.description}',
                  style: TextStyle(
                      fontSize: screenWidth(20), fontWeight: FontWeight.bold),
                ),
                20.ph,
                Row(
                  children: [
                    Text(
                      tr("key_category1"),
                      style: TextStyle(
                          color: AppColors.fillColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(19)),
                    ),
                    Text(
                      '${widget.model.category}',
                      style: TextStyle(
                        fontSize: screenWidth(20),
                      ),
                    ),
                  ],
                ),
                20.ph,
                Row(
                  children: [
                    Text(
                      tr("key_price1"),
                      style: TextStyle(
                          color: AppColors.fillColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(19)),
                    ),
                    Text(
                      '${widget.model.price}',
                      style: TextStyle(
                        fontSize: screenWidth(20),
                      ),
                    ),
                  ],
                ),
              ]),
          PositionedDirectional(
            bottom: 0,
            child: Stack(
              children: [
                Container(
                  color: AppColors.mainWhiteColor,
                  width: screenWidth(1),
                  height: 70,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.fillColor),
                        onPressed: () {
                          controller.addToCart();
                        },
                        child: Text(tr("key_add"))),
                    SizedBox(
                      width: 80,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.changeCount(false);
                      },
                      child: Text('-'),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColors.fillColor),
                    ),
                    Obx(
                      () => Text(
                        '${controller.count}',
                        style: TextStyle(fontSize: screenWidth(10)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.changeCount(true);
                      },
                      child: Text('+'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.fillColor,
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
