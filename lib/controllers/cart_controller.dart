import 'package:food_delivery_app/data/repositories/cart_repo.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  //This is the global variable where all the _inCartItems are added.
  Map<int, CartModel> items = {};

  void addItem({required ProductModel product, required int itemQuantity}) {

    items.putIfAbsent(product.id!, () => CartModel(
      id: product.id,
      name: product.name,
      img: product.img,
      price: product.price,
      quantity: itemQuantity,
      // isExist: ,
      time: DateTime.now().toString(),
    ));
  }
}