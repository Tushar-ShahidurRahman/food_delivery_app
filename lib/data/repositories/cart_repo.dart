import 'dart:convert';

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


  CartRepo({required this.sharedPreference} );

/*  SharedPreference can only save the data as String. That's why List<String>
  This is a global variable.*/
  List<String> _cart = [];

  // This is for the cart history section. After check out, we will see the history from this list.
  List<String> _cartHistory = [];

  // This method is for adding a list of cart Model object in shared preference.
  // Method's name in video is addToCartList(object)
  Future<void> addDataToSharedPreference(
      {required List<CartModel> cartList}) async {
    String time = DateTime.now().toString(); // this time variable is for saving all the data in one time chunk.
    // in video this function is not async.
    // again initializing the list because i don't want duplication.
    _cart = [];
    /*Here i am changing the element type from cartModel to String. I am using a method
    called toJson form the CartModel for this purpose. i don't have to use it explicitly.
    when necessary the model uses it implicitly. That's why iam just calling jsonEncode(element)
    */
    for (var element in cartList) {
        // object -> json -> String. (Use to json and jsonEncode)
      element.time = time;
        return _cart.add(jsonEncode(element));
      };
    //saving in SharedPreference is happening here.
    await sharedPreference.setStringList(AppConstants.CART_LIST, _cart);
    // print(sharedPreference.getStringList(AppConstants.CART_LIST));
  }


  // This method is for fetching data from shared preference.
  // Method's name used in the video is getCartList()
  List<CartModel> getDataFromSharedPreference() {
/*   1st check if data is present in SP
   if exist, then add to a local variable. Here _carts*/
    List<String> _carts = [];
    if (sharedPreference.containsKey(AppConstants.CART_LIST)) {
      _carts = sharedPreference.getStringList(AppConstants.CART_LIST)!;
    }
    // Take another list which contains Cart Model But why?
    List<CartModel> _cartItems = [];
    for(var element in _carts) {
/*      Any time i fetch data from any kind of database/storage, i have to convert it to object
      using relevant Model.fromJson method... Other wise there will be problem when i go to use that
      data in the app. So, i am converting the data into object.  */
      // String -> Json -> object (Use fromJson and jsonDecode)
       _cartItems.add(CartModel.fromJson(jsonDecode(element)));
    };
    return _cartItems;
    /*
    i have finished the method. Good.
    Now i need to call it from the cart controller. So that eventually i can use it in the UI.
    */
  }

  //This method is for adding cart history list to shared preference.
  void addCartHistoryDataToSharedPreference() {
    if(sharedPreference.containsKey(AppConstants.CART_HISTORY_LIST)){
      _cartHistory = sharedPreference.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < _cart.length; i++) {
      _cartHistory.add(_cart[i]);
    }
    //removing all the items from the cart list. and also from shared preference here. So that new batch of orders can be added.
    removeFromCart();
    //  Then add the list to shared preference.
    sharedPreference.setStringList(
        AppConstants.CART_HISTORY_LIST, _cartHistory);
  }
  //This method does the removing.
  void removeFromCart() {
    _cart = [];
    sharedPreference.remove(AppConstants.CART_LIST);
  }

  //This method gets the history list from the shared preference. And this method will be used to show cart history from the cart history page.
  //in video the method name is getCartHistoryList()
  List<CartModel> getCartHistoryDataFromSharedPreference() {
    // List<String> _cartHistoryTemp = [];
    if (sharedPreference.containsKey(AppConstants.CART_HISTORY_LIST)) {
      // _cartHistory = [];
      _cartHistory =
      sharedPreference.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> _cartHistoryList = []; 
    for (var element in _cartHistory) {
       _cartHistoryList.add(CartModel.fromJson(jsonDecode(element)));
    }
    return _cartHistoryList;
  }
}
