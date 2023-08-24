import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/custom_widgets/app_icon.dart';
import 'package:food_delivery_app/custom_widgets/big_text.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<CartModel> getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> _cartItemsPerOrder = {};
    // I am creating and updating a map from the History list of cart models.
    for (int i = 0; i < getCartHistoryList.length; i++){
      if(_cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        _cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      } else{
        _cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    //This method returns the value of the key "time".
    List<int> getOrderTimeInList() {
      return _cartItemsPerOrder.entries.map((e) => e.value).toList();
    }
    // Here i am calling the function.(getOrderTimeInList)
    List<int> itemsPerOrder = getOrderTimeInList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height80+5,
            width: double.maxFinite,
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: 'Cart history', color: Colors.white),
                AppIcon(icon: Icons.shopping_cart_outlined, iconColor: AppColors.mainColor,
                // backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: Dimensions.width16, top: Dimensions.height16, right: Dimensions.width16),
            child: ListView(
              children: [
                for(int i = 0; i<itemsPerOrder.length; i++)
                  Container(
                    child: Column(
                      children: [
                        BigText(text: '24/8/23'),
                        Row(
                          children: [
                            Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Text("Hi there"),
                                  Text("Hi there"),
                                  Text("Hi there"),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
