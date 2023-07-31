import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedFoodProductItemRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedFoodProductItemRepo({ required this.apiClient});

  Future<Response> getRecommendedFoodItem() async {
    Future<Response> response = apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
    return response;
  }
}