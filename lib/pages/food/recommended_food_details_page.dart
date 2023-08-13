import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_food_products_controller.dart';
import 'package:food_delivery_app/controllers/recommended_food_product_controller.dart';
import 'package:food_delivery_app/custom_widgets/app_icon.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/custom_widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class RecommendedFoodDetailsPage extends StatelessWidget {
  // final String demoTextShort = "This is a demo test for short version";
  // final String demoTextLong =
  //     """This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end.""";
  final int pageId;
  final String pageName;

  const RecommendedFoodDetailsPage({Key? key, required this.pageId, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Get.find<RecommendedFoodProductsController>()
        .recommendedFoodProductList[pageId];
    Get.find<PopularFoodProductsController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.height36 * 2,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(pageName == 'cart page'){
                        Get.toNamed(RouteHelper.getCartPage());
                      } else{
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                      backgroundColor: Colors.white70,
                      iconSize: Dimensions.iconSize16 + 4,
                    ),
                  ),
                  // AppIcon(
                  //   icon: Icons.shopping_cart_outlined,
                  //   // iconSize: Dimensions.iconSize16,
                  //   backgroundColor: Colors.white70,
                  // ),
                  GetBuilder<PopularFoodProductsController>(
                      builder: (popularProductController) {
                        return GestureDetector(
                          onTap: () {
                            if(
                            popularProductController.totalProductCount>=1) {
                              Get.toNamed(RouteHelper.getCartPage());
                            }
                          },
                          child: Stack(
                            children: [
                              AppIcon(icon: Icons.shopping_cart_outlined),
                              //This section is for showing the circle icon with main color as background.
                              popularProductController.totalProductCount >= 1
                                  ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(icon: Icons.circle,
                                  backgroundColor: AppColors.mainColor,
                                  iconColor: Colors.transparent,
                                  size: 20,
                                ),
                              )
                                  :
                              // Or else, show an empty container.
                              Container(),
                              // This section is for showing the Text inside of the circle icon.
                              popularProductController.totalProductCount >= 1
                                  ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(text: popularProductController.totalProductCount.toString(), size: 12, color: Colors.white,),
                              ): Container(),
                            ],
                          ),
                        );
                      })
                ],
              ),
              backgroundColor: AppColors.yellowColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height32),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height4, bottom: Dimensions.height4),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimensions.font20,
                  )),
                ),
              ),
              // expandedHeight: 355,
              expandedHeight: Dimensions.height100 * 3.5,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URI +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  // 'assets/image/food0.png',
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width16,
                    right: Dimensions.width16,
                    top: Dimensions.width10),
                child: ExpandableTextWidget(text: product.description!),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<PopularFoodProductsController>(
        builder: (popularProductController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width32 * 2,
                  right: Dimensions.width32 * 2,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Using popular food controller here, because the methods are reusable. I don't have
                        // to write the same methods for recommended food controller
                        popularProductController.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                    BigText(
                        text:
                            '\$${product.price!} X ${popularProductController.inCartItem}',
                        size: Dimensions.font26),
                    GestureDetector(
                      onTap: () {
                        popularProductController.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ),
                  ],
                ),
              ),
              //  Todo: Add the container
              Container(
                height: Dimensions.bottomNavBarContainerHeight,
                decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.width8,
                    right: Dimensions.width8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: Dimensions.width16),
                          padding: EdgeInsets.only(
                              left: Dimensions.width16,
                              right: Dimensions.width16,
                              top: Dimensions.height16,
                              bottom: Dimensions.height16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius8 * 2),
                            ),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                          )),
                      GestureDetector(
                        onTap: () {
                          popularProductController.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: Dimensions.width16,
                              right: Dimensions.width16,
                              top: Dimensions.height16 + 4,
                              bottom: Dimensions.height16),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius20),
                            ),
                          ),
                          child: BigText(
                            text: '\$ ${product.price!} | Add to cart',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
