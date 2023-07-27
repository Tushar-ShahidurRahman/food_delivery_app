import 'package:food_delivery_app/data/repositories/popular_food_product_item_repo.dart';
import 'package:get/get.dart';

class PopularFoodProductsController extends GetxController{
  PopularFoodProductItemRepo popularFoodProductItemRepo;
  PopularFoodProductsController({required this.popularFoodProductItemRepo});

  var _foodProductList = [];
   get foodProductList => _foodProductList;

   Future<void> getPopularFoodItem() async {
     Response response = await popularFoodProductItemRepo.getPopularFoodItem();
     if(response.statusCode == 200) {
        // again initializing this list for preventing data duplication.
        _foodProductList = [];
        // _foodProductList.addAll();
       update();
     }
   }
}