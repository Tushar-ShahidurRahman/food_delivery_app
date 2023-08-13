import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_food_products_controller.dart';
import 'package:food_delivery_app/controllers/recommended_food_product_controller.dart';
// import 'package:food_delivery_app/helper/dependencies.dart' as dependencies;
import 'package:food_delivery_app/pages/food/popular_food_details_page.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details_page.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dependencies;
import 'pages/home/main_food_page.dart';
import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularFoodProductsController>().getPopularFoodItem();
    Get.find<RecommendedFoodProductsController>().getRecommendedFoodItem();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: MainFoodPage(),
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}

