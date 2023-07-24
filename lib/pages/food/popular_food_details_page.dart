import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/app_column_with_stars.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

import '../../custom_widgets/app_icon.dart';
import '../../custom_widgets/big_text.dart';
import '../../custom_widgets/icon_and_text_widget.dart';
import '../../custom_widgets/small_text.dart';
import '../../utils/colors.dart';

class PopularFoodDetailsPage extends StatelessWidget {
  const PopularFoodDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
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
                  child: const AppColumnWithStars(text: 'Bitter Orange Marinade'),
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
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
                width: 130,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius8),
                  ),
                ),
                child: Row(children: [
                  TextButton(onPressed: () {}, child: const Icon(Icons.remove, color: Colors.black38,)),

                  TextButton(onPressed: () {}, child: const Icon(Icons.add, color: Colors.black38,)),
                ],),
              ),
              Container(
                width: 170,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
