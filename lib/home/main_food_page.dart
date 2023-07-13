import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/custom_widgets/small_text.dart';
import 'package:food_delivery_app/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Container(
              //I will use the above container for changing color in the future. Now it is unnecessary.
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 115,
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
                        BigText(text: 'Bangladesh', color: AppColors.mainColor),
                        Row(
                          // This row is for the subtext and dropdown menu item
                          children: [
                            SmallText(text:'Dhaka',
                                color: Colors.black54
                              ),
                            // SizedBox(width: 10),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ]),
                      // Below container is for search icon
                      Center(
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor,
                          ),
                          child: Icon(Icons.search, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FoodPageBody(),
          ],
        ),
      ),
    );
  }
}
