import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_food_products_controller.dart';
import 'package:food_delivery_app/controllers/recommended_food_product_controller.dart';
import 'package:food_delivery_app/custom_widgets/app_icon.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/custom_widgets/small_text.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height16 * 4,
            left: Dimensions.width24 - 4,
            right: Dimensions.width24 - 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width100),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
              top: Dimensions.height100,
              left: Dimensions.width16,
              right: Dimensions.width16,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height16),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      //This section is for showing the CART ITEMS on by one in the cart page.
                      List<CartModel> _cartList = cartController.getItems;
                      return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: Dimensions.height80 + 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                // This below container is for showing image
                                GestureDetector(
                                  onTap: () {
                                    var _popularIndex = Get.find<
                                            PopularFoodProductsController>()
                                        .popularFoodProductList
                                        .indexOf(_cartList[index].product!);
                                    if(_popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(pageId: _popularIndex, pageName: 'cart page'));
                                    } else {
                                      var _recommendedIndex = Get.find<
                                          RecommendedFoodProductsController>()
                                          .recommendedFoodProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(RouteHelper.getRecommendedFood(pageId: _recommendedIndex, pageName: 'cart page'));
                                    }
                                  },
                                  child: Container(
                                    height: Dimensions.height32,
                                    width: Dimensions.height32,
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height8 + 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URI +
                                                    AppConstants.UPLOAD_URL +
                                                    cartController
                                                        .getItems[index]
                                                        .img!))),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width8),
                                // This part is for showing other stuffs and infos like cart quantity and price.
                                Expanded(
                                  child: Container(
                                    height: Dimensions.height80 + 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: cartController
                                              .getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: 'spicy'),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                  text: cartController
                                                      .getItems[index].price!
                                                      .toString(),
                                                  color: Colors.redAccent),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width16,
                                                    right: Dimensions.width16,
                                                    top: Dimensions.height16,
                                                    bottom:
                                                        Dimensions.height16),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        Dimensions.radius8 * 2),
                                                  ),
                                                ),
                                                //This Row below is for the counter part. (- 0 +)
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartController.addItem(
                                                              product:
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                              itemQuantity: -1);
                                                        },
                                                        child: Icon(
                                                            Icons.remove,
                                                            color: AppColors
                                                                .signColor)),
                                                    SizedBox(
                                                        width:
                                                            Dimensions.width4),
                                                    BigText(
                                                      text: cartController
                                                          .getItems[index]
                                                          .quantity
                                                          .toString(),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            Dimensions.width4),
                                                    GestureDetector(
                                                        onTap: () {
                                                          cartController.addItem(
                                                              product:
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                              itemQuantity: 1);
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: AppColors
                                                                .signColor)),

                                                    // TextButton(onPressed: () {}, child: const Icon(Icons.add, color: Colors.black38,)),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: Dimensions.width4),
                        // SHOWING THE TOTAL AMOUNT FROM HERE
                        BigText(
                            text:
                            "\$${cartController.totalAmount}"),
                        SizedBox(width: Dimensions.width4),
                      ],
                    ),
                  ),
                  Container(
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
                    child: GestureDetector(
                      onTap: () {
                        // popularProductController.addItem(product);
                        cartController.addCartHistoryDataToSPInController();
                      },
                      child: BigText(
                        text: 'Check out',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
