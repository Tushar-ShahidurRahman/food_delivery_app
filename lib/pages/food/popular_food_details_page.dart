import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/app_column_with_stars.dart';
import 'package:food_delivery_app/custom_widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

import '../../custom_widgets/app_icon.dart';
import '../../custom_widgets/big_text.dart';
import '../../utils/colors.dart';

class PopularFoodDetailsPage extends StatelessWidget {
  final String demoTextShort = "This is a demo test for short version";
  final String demoTextLong =
      """This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end.""";

  const PopularFoodDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Food image section
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImgSize,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/food0.png'),
                    ),
                  ),
                )),
            // Icon section on the image
            Positioned(
              top: Dimensions.height16,
              left: Dimensions.width16,
              right: Dimensions.width16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   Inside this Row i need to place two icons. But those icons needs to be reusable.
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
            ),
            // Food intro section
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImgSize - Dimensions.height16,
                child: Container(
                  // height: double.infinity,
                  padding: EdgeInsets.only(
                      left: Dimensions.width8,
                      right: Dimensions.width8,
                      top: Dimensions.width16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColumnWithStars(text: 'Bitter Orange Marinade'),
                      SizedBox(height: Dimensions.height16),
                      BigText(text: 'Introduce'),
                      SizedBox(height: Dimensions.height16),
                      //  Expandable text
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(text: demoTextLong))),
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                    Icon(Icons.remove, color: AppColors.signColor),
                    SizedBox(width: Dimensions.width4),
                    BigText(text: '0'),
                    SizedBox(width: Dimensions.width4),
                    Icon(Icons.add, color: AppColors.signColor),

                    // TextButton(onPressed: () {}, child: const Icon(Icons.add, color: Colors.black38,)),
                  ],
                ),
              ),
              Container(
                // width: 170,
                // height: 60,
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
                  text: '\$10 | Add to cart',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
