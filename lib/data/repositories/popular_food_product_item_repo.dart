import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularFoodProductItemRepo extends GetxService{
  final ApiClient apiClient;

  PopularFoodProductItemRepo({ required this.apiClient});

  Future<Response> getPopularFoodItem() async {
    Future<Response> response = apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    return response;
  }
}