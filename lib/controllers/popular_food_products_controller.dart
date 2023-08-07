import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repositories/popular_food_product_item_repo.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class PopularFoodProductsController extends GetxController {
  PopularFoodProductItemRepo popularFoodProductItemRepo;

  PopularFoodProductsController({required this.popularFoodProductItemRepo});

  List<ProductModel> _popularFoodProductList = [];
  List<ProductModel> get popularFoodProductList => _popularFoodProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  late CartController _cart;

  //Calling the method in repository.
  Future<void> getPopularFoodItem() async {
    Response response = await popularFoodProductItemRepo.getPopularFoodItem();
    if (response.statusCode == 200) {
      log('Got data');
      // again initializing this list for preventing data duplication.
      _popularFoodProductList = [];
      _popularFoodProductList.addAll(Product.fromJson(response.body).products!);
      _isLoaded = true;
      update();
    }
  }

//   set Quantity method for bottom nav bar container.

  void setQuantity(bool isIncrease) {
    if (isIncrease) {
      _quantity = orderLimit(_quantity + 1);
      // orderLimit(_quantity++);
      // log('quantity +$_quantity');
    } else {
      _quantity = orderLimit(_quantity - 1);
      // orderLimit(_quantity--);
      // log('quantity +$_quantity');
    }
    update();
  }

// method for limiting order number between 0 and 20
//  The name of this function is checkQuantity() in the video.
  int orderLimit(int orderQuantity) {
    if (_inCartItem + orderQuantity < 0) {
      // note: I should not add this code here. It should go to UI.
      Get.snackbar(
        'Order limit',
        'You can not reduce more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (_inCartItem + orderQuantity > 20) {
      Get.snackbar(
        'Order limit',
        'You can not add more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return orderQuantity;
    }
  }

// This method will reset the quantity and cart item as per logic when the (Popular/Recommended)page reloads.
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
      //     Then check the global variable (_items) stored in Cart_Controller if _inCartItem has any value
      //     stored or not. And reset the _inCartItem with that value.
    bool _isExist = false;
    _isExist = _cart.itemExist(product);
    if(_isExist) {
      _inCartItem = _cart.getProductQuantity(product);
    }
  }

  // This method is calling the addItem method in cart controller from this product Controller.
  void addItem(ProductModel product) {
      _cart.addItem(product: product, itemQuantity: _quantity);
      _quantity = 0;
      _inCartItem = _cart.getProductQuantity(product);

      update();
    }

    int get totalProductCount{
    return _cart.totalProductCount;
    }
}
