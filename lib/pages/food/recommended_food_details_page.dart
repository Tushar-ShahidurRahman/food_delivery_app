import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/app_icon.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/custom_widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

class RecommendedFoodDetailsPage extends StatelessWidget {
  final String demoTextShort = "This is a demo test for short version";
  final String demoTextLong =
      """This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end.This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end. This is a demo test for long version, This is very good, And i will continue it till the end.""";

  const RecommendedFoodDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                      backgroundColor: Colors.white70,
                      iconSize: Dimensions.iconSize16 + 4,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    // iconSize: Dimensions.iconSize16,
                    backgroundColor: Colors.white70,
                  ),
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
                    text: 'Sliver App bar',
                    size: Dimensions.font20,
                  )),
                ),
              ),
              expandedHeight: 355,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/image/food14.jpeg',
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
                child: ExpandableTextWidget(text: demoTextLong),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                    icon: Icons.remove, backgroundColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimensions.iconSize24,),
                BigText(text: '\$18 X 0', size: Dimensions.font26),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                )
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
                    child: Icon(Icons.favorite, color: AppColors.mainColor,)
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
                    child: BigText(
                      text: '\$18 | Add to cart',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
