import 'dart:developer';

import 'package:food_delivery_app/data/repositories/popular_food_product_item_repo.dart';
import 'package:get/get.dart';

import '../data/repositories/recommended_food_product_item_repo.dart';
import '../models/product_model.dart';

class RecommendedFoodProductsController extends GetxController{
  RecommendedFoodProductItemRepo recommendedFoodProductItemRepo;
  RecommendedFoodProductsController({required this.recommendedFoodProductItemRepo});

  List<ProductModel> _recommendedFoodProductList = [];
  List<ProductModel> get recommendedFoodProductList => _recommendedFoodProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedFoodItem() async {
    Response response = await recommendedFoodProductItemRepo.getRecommendedFoodItem();
    if(response.statusCode == 200) {
      log('Got Recommended food data');
      // again initializing this list for preventing data duplication.
      _recommendedFoodProductList = [];
      _recommendedFoodProductList.addAll(Product.fromJson(response.body).products!);
      _isLoaded = true;
      update();
    }
  }
}