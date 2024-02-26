import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge_2/core/translation/app_translation.dart';
import 'package:challenge_2/main.dart';
import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_bottom_sheat.dart';
import 'package:challenge_2/ui/shared/custom_widgets/custom_categorry.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:challenge_2/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:challenge_2/ui/views/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        Text(
          tr("key_category"),
          style: TextStyle(
            color: AppColors.mainblack,
            fontSize: screenWidth(10),
          ),
        ),
        10.ph,
        SizedBox(
          height: 50,
          child: Obx(() {
            return SizedBox(
                height: 50,
                child: controller.categoryList.isEmpty
                    ? Text(tr("key_no_category"))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          String categoryy = controller.categoryList[index];
                          // controller.selectedcategory =
                          //     controller.categoryList[index];
                          return CustomCat(
                              categoryName: categoryy, index: index);
                        }));
          }),
        ),
        20.ph,
        Text(
          tr("key_products"),
          style:
              TextStyle(color: AppColors.mainblack, fontSize: screenWidth(10)),
        ),
        10.ph,
        Obx(() {
          return controller.isProductsLoading
              ? SpinKitCircle(
                  color: AppColors.mainBlueColor,
                )
              : SizedBox(
                  height: screenHieght(1.55),
                  child: controller.productsList.isEmpty
                      ? Text(tr("key_no_product"))
                      : GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.productsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: screenHieght(3),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 9,
                                  mainAxisSpacing: 40),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                    () => ProductDetailsView(
                                      model: controller.productsList[index],
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
                                            color:
                                                AppColors.placeholderGreyColor,
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                                    bottomStart:
                                                        Radius.circular(20)),
                                          ),
                                          child: RatingBar.builder(
                                            initialRating: controller
                                                .productsList[index]
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
                                            itemBuilder: (context, _) =>
                                                SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                    .productsList[index]
                                                    .image ??
                                                '',
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Container(
                                              width: screenWidth(20),
                                              height: screenWidth(20),
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
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
                                              controller.productsList[index]
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
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    tr("key_price"),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: AppColors
                                                            .mainBlueColor),
                                                  ),
                                                  Text(
                                                    '${controller.productsList[index].price}',
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.mainblack,
                                                        fontWeight:
                                                            FontWeight.bold),
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
