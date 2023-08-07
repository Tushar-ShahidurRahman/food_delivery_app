import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repositories/cart_repo.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  //This is the global variable where all the _inCartItems are added.
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  //This method is for adding item in the _items dictionary
  void addItem({required ProductModel product, required int itemQuantity}) {
    int _totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      // This part is for update the existing value.
      _items.update(
        product.id!,
        (value) {
          _totalQuantity = value.quantity! + itemQuantity;
          return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            quantity: _totalQuantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        },
      );
      if (_totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      //This part is for new item insertion.
      if (itemQuantity > 0) {
        _items.putIfAbsent(
            product.id!,
            () => CartModel(
                  id: product.id,
                  name: product.name,
                  img: product.img,
                  price: product.price,
                  quantity: itemQuantity,
                  isExist: true,
                  time: DateTime.now().toString(),
                ));
      } else {
        Get.snackbar(
          'Order limit',
          'You should add at least 1 item!',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
  }

  // Checks if the value is there
  bool itemExist(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  // Returns the quantity of the item.
  int getProductQuantity(ProductModel product) {
    int _prodQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id!) {
          _prodQuantity = value.quantity!;
        }
      });
    }
    return _prodQuantity;
  }

  int get totalProductCount{
    int _totalProdCount = 0;
    _items.forEach((key, value) {
      // _totalProdCount = _totalProdCount + value.quantity!;
      _totalProdCount += value.quantity!;
    });
    return _totalProdCount;
  }

}
