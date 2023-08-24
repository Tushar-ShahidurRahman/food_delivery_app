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

  //For storage and shared preference only
  List<CartModel> storageItems = [];

  //This method is for updating, removing and adding an item in the _items dictionary
  void addItem({required ProductModel product, required int itemQuantity}) {
    int _totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      // This part is for update the existing value.
      _items.update(
        product.id!,
        (value) {
          _totalQuantity = value.quantity! + itemQuantity;
          //Even if the _totalQuantity equals to zero, we should update the value. Then
          //we will remove it by calling remove.
          return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            quantity: _totalQuantity,
            isExist: true,
            time: DateTime.now().toString(),
            //1st product is from the cart model
            //2nd product is from the argument provided by popular/recommended food product controller.
            product: product,
          );
        },
      );
      //removing logic is here.
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
              product: product,
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
    //sending data to shared preference from here.
    cartRepo.addDataToSharedPreference(cartList: getItems);
    update();
  }

  // Checks if the value is there
  bool itemExist(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  // Returns the quantity of an specific item.
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

  //This method is for getting the total product count added in the cart
  int get totalProductCount{
    int _totalProdCount = 0;
    _items.forEach((key, value) {
      // _totalProdCount = _totalProdCount + value.quantity!;
      _totalProdCount += value.quantity!;
    });
    return _totalProdCount;
  }

  // This function is for returning the recent List of items saved in the _items map
  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  //This function is for getting the total amount of money when items added to the cart.
  int get totalAmount{
    int _total = 0;
    _items.forEach((key, value) {
      _total += (value.quantity! * value.price!).ceil();
    });

    return _total;
  }

//  I have to call the getDataFromSharedPreference from here
//This method will be called every time the App restarts.
List<CartModel> getCartDataFromSPInController() {
    setItems = cartRepo.getDataFromSharedPreference();
    return storageItems;
}
// setItems To StorageItems List
set setItems(List<CartModel> cartItems) {
    storageItems = cartItems;
//    i need index. that's why i am using for loop
  for(int i = 0; i < storageItems.length; i++) {
    // need to modify the _items map. Because after restarting the app, _items will be empty. This
    // line of code will repopulate the _items map with existing items remained in the cart.
    _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
  }
}

//This method is for call addHistory data to sp from the controller. And then clearing the _items map. It is called from check out.
void addCartHistoryDataToSPInController() {
    cartRepo.addCartHistoryDataToSharedPreference();
    clear();
}

  void clear() {
    _items = {};
    update();
  }

List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryDataFromSharedPreference();
}

}
