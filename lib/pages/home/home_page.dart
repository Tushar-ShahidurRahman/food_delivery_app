import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text('Next page'))),
    Container(child: Center(child: Text('Next Next page'))),
    Container(child: Center(child: Text('Next Next Next page'))),
  ];

  void onTapNav(int index) {
    _selectedIndex = index;
    setState(() {});
  }
 // build method for manual simple bottom nav bar.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTapNav,
          currentIndex: _selectedIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          unselectedItemColor: Colors.black38,
          selectedItemColor: AppColors.mainColor,
          unselectedFontSize: 0,
          selectedFontSize: 0,


          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined), label: 'history'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'me'),
      ]),
    );
  }
}
