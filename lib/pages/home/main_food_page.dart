import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/custom_widgets/small_text.dart';
// import 'package:food_delivery_app/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';

import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // print('height: $height');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              //I will use the above container for changing color in the future. Now it is unnecessary.
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height8,
                    horizontal: Dimensions.width8),
                // SHOWING THE HEADER
                child: Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.height16, bottom: Dimensions.height8),
                  padding: EdgeInsets.only(
                      left: Dimensions.width16, right: Dimensions.width16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    //The above row is acting as the main row for the header.
                    children: [
                      Column(
                          // This column is for containing both the Name of the country and subsequent
                          // row which have city name and dropdown menu.
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BigText(
                                text: 'Bangladesh', color: AppColors.mainColor),
                            Row(
                              // This row is for the subtext and dropdown menu item
                              children: [
                                SmallText(text: 'Dhaka', color: Colors.black54),
                                // SizedBox(width: 10),
                                const Icon(Icons.arrow_drop_down_rounded),
                              ],
                            ),
                          ]),
                      // Below container is for search icon
                      Center(
                        child: Container(
                          height: Dimensions.height36,
                          width: Dimensions.width36,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius8),
                            color: AppColors.mainColor,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: Dimensions.iconSize24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SHOWING THE BODY
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
