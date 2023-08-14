import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/popular_food_products_controller.dart';
import '../../controllers/recommended_food_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
//We gonna use this page for animation, showing logo, and load data from the api via controller.
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  Future<void> _loadResources() async {
    await Get.find<PopularFoodProductsController>().getPopularFoodItem();
    await Get.find<RecommendedFoodProductsController>().getRecommendedFoodItem();
  }

  @override
  void initState() {
    super.initState();
    // calling the controllers to load the necessary data.
    _loadResources();
    /*the double dot .. here is interesting. 1st dot is creating and object and 2nd dot is
     for accessing the forward() method declared in that object.*/
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    Timer(const Duration(seconds: 3), () => Get.toNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: _animation,
          child: Center(child: Image.asset('assets/image/logo part 1.png', width: Dimensions.splashScreenImg) )),
          Center(child: Image.asset('assets/image/logo part 2.png', width: Dimensions.splashScreenImg,)),
        ],
      ),
    );
  }
}
