import 'package:food_delivery_app/data/repositories/cart_repo.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  //This is the global variable where all the _inCartItems are added.
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  //This method is for adding item in the _items dictionary
  void addItem({required ProductModel product, required int itemQuantity}) {
    if (_items.containsKey(product.id!)) {
      // This part is for update the existing value.
      _items.update(
          product.id!,
          (value) => CartModel(
                id: value.id,
                name: value.name,
                img: value.img,
                price: value.price,
                quantity: value.quantity! + itemQuantity,
                isExist: true,
                time: DateTime.now().toString(),
              ));
    } else {
      //This part is for new item insertion.
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
    }
  }

  // Checks if the value is there
  bool itemExist(ProductModel product) {
    if(_items.containsKey(product.id!)){
      return true;
    }
    return false;
 }
 // Returns the quantity of the item.
 int getProductQuantity(ProductModel product) {
    int _prodQuantity = 0;
    if(_items.containsKey(product.id!)){
      _items.forEach((key, value) {
        if(key == product.id!){
          _prodQuantity = value.quantity!;
        }
      });
    }
    return _prodQuantity;
 }

}
