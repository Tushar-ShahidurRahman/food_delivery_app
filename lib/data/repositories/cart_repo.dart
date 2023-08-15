import 'dart:convert';

import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
/* I should have a field for api client. But tutorial doesn't doing that right away. I am wandering why? I will get the reason in future.
Then i should add a constructor.
I got the answer. I will call shared preference from here.

Repo works both for getting the data and posting the data. As i am saving data locally here,
i will not go to api client. And that's why i will save data in the local storage from here. From this cart repo.

Then some methods for storing and calling data.*/

  final SharedPreferences sharedPreference;
  CartRepo({required this.sharedPreference});

/*  SharedPreference can only save the data as String. That's why List<String>
  This is a global variable.*/
  List<String> cart = [];

  // This method is for adding a list of cart Model object in shared preference.
  // Method's name in video is addToCartList(object)
  Future<void> addDataToSharedPreference({required List<CartModel> cartList}) async {
    // again initializing the list because i don't want duplication.
    cart = [];
    /*Here i am changing the element type from cartModel to String. I am using a method
    called toJson form the CartModel for this purpose. i don't have to use it explicitly.
    when necessary the model uses it implicitly. That's why iam just calling jsonEncode(element)
    */
    cartList.forEach((element) {
      // object -> json -> String. (Use to json and jsonEncode)
      return cart.add(jsonEncode(element));
    });
    //saving in SharedPreference is happening here.
    await sharedPreference.setStringList(AppConstants.CART_LIST, cart);
    print(sharedPreference.getStringList(AppConstants.CART_LIST));
  }



  // This method is for fetching data from shared preference.
  // Method's name used in the video is getCartList()
  List<CartModel> getDataFromSharedPreference() {
/*   1st check if data is present in SP
   if exist, then add to a local variable. Here _carts*/
    List<String> _carts = [];
    if(sharedPreference.containsKey(AppConstants.CART_LIST)){
      _carts = sharedPreference.getStringList(AppConstants.CART_LIST)!;
    }
    // Take another list which contains Cart Model But why?
    List<CartModel> _cartItems = [];
    _carts.forEach((element) {
/*      Any time i fetch data from any kind of database/storage, i have to convert it to object
      using relevant Model.fromJson method... Other wise there will be problem when i go to use that
      data in the app. So, i am converting the data into object.  */
      // String -> Json -> object (Use fromJson and jsonDecode)
      return _cartItems.add(CartModel.fromJson(jsonDecode(element)));
    });
    return _cartItems;
    /*
    i have finished the method. Good.
    Now i need to call it from the cart controller. So that eventually i can use it in the UI.
    */
  }
}
