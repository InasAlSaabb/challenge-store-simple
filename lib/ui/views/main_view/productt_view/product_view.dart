import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_2/core/translation/app_translation.dart';
import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_form.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/main_view/productt_view/product_controller.dart';
import 'package:challenge_2/ui/views/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductsController controller = Get.put(ProductsController());
  @override
  void initState() {
    controller.filteredProductsList.value = controller.productsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(20)),
      children: [
        30.ph,
        Text(
          tr("key_All_Products"),
          style: TextStyle(
              color: AppColors.mainblack,
              fontSize: screenWidth(15),
              fontWeight: FontWeight.bold),
        ),
        30.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
          child: CustomTextFormField(
            hintText: tr("key_search"),
            controller: controller.controllerr,
            fillColor: AppColors.mainWhiteColor,
            hintTextColor: AppColors.mainGreyColor,
            prefixIcon: Icon(Icons.search),
            onChanged: (query) {
              controller.search(query);
            },
          ),
        ),
        20.ph,
        Obx(() {
          return controller.isProductsLoading
              ? SpinKitCircle(
                  color: AppColors.mainBlueColor,
                )
              : SizedBox(
                  height: screenHieght(1.5),
                  child: GridView.builder(
                      itemCount: controller.filteredProductsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 9,
                          mainAxisExtent: screenHieght(3),
                          mainAxisSpacing: 40),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => ProductDetailsView(
                                  model: controller.filteredProductsList[index],
                                ),
                              );
                            },
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              alignment: AlignmentDirectional.center,
                              width: screenWidth(3),
                              decoration: BoxDecoration(
                                color: AppColors.mainWhiteColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.mainGreyColor,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: Container(
                                      height: screenHieght(40),
                                      width: screenWidth(3),
                                      decoration: BoxDecoration(
                                        color: AppColors.placeholderGreyColor,
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                                bottomStart:
                                                    Radius.circular(20)),
                                      ),
                                      child: RatingBar.builder(
                                        initialRating: controller
                                            .filteredProductsList[index]
                                            .rating!
                                            .rate!,
                                        ignoreGestures: true,
                                        minRating: 1,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemSize: 8,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
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
                                    ),
                                  ),
                                  screenWidth(30).ph,
                                  Container(
                                    width: screenWidth(4),
                                    height: screenWidth(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                                .filteredProductsList[index]
                                                .image ??
                                            '',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          width: screenWidth(20),
                                          height: screenWidth(20),
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  screenWidth(25).ph,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.filteredProductsList[index]
                                                  .title ??
                                              '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth(30),
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        screenWidth(30).ph,
                                        Row(children: [
                                          Text(
                                            tr("key_price"),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.mainBlueColor),
                                          ),
                                          Text(
                                            '${controller.filteredProductsList[index].price}',
                                            style: TextStyle(
                                                color: AppColors.mainblack,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                          ),
                                        ])
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
        }),
      ],
    );
  }
}
