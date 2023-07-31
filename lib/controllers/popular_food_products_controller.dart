import 'dart:developer';

import 'package:food_delivery_app/data/repositories/popular_food_product_item_repo.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class PopularFoodProductsController extends GetxController{
  PopularFoodProductItemRepo popularFoodProductItemRepo;
  PopularFoodProductsController({required this.popularFoodProductItemRepo});

  List<ProductModel> _popularFoodProductList = [];
  List<ProductModel> get popularFoodProductList => _popularFoodProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

   Future<void> getPopularFoodItem() async {
     Response response = await popularFoodProductItemRepo.getPopularFoodItem();
     if(response.statusCode == 200) {
       log('Got data');
        // again initializing this list for preventing data duplication.
        _popularFoodProductList = [];
        _popularFoodProductList.addAll(Product.fromJson(response.body).products!);
        _isLoaded = true;
       update();
     }
   }
}