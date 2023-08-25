import 'package:cloth_shop_app/controller/Customer/product_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartController extends GetxController{

  // ProductController productController = Get.find<ProductController>();
  // var product = Get.find<ProductController>().allProducts!;

  RxString id = "".obs;
  RxString name = "".obs;
  RxString image = "".obs;
  RxString price = "".obs;
  RxBool isAddedToCart = false.obs;
  RxInt quantity = 1.obs;

  List<Map<String, dynamic>> items = [];

  final clothAppCartBox = Hive.openBox("cloth_app_cart");


  Future<void> addToCart(String id, String name, String image, String price) async {
    createItem({
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity.value,
    });
  }

  Future<void> createItem (Map<String, dynamic> newItem) async {
    final clothAppCartBox = await Hive.openBox("cloth_app_cart");
    await clothAppCartBox.add(newItem);
    // refreshCart();
    print("Total data is ${clothAppCartBox.length}");
  }
  // void refreshCart() async {
  //   final clothAppCartBox = await Hive.openBox('cloth_app_cart'); // Open the Hive box
  //
  //   final data = clothAppCartBox.keys.map((key) {
  //     final item = clothAppCartBox.get(key);
  //     return {
  //       'key': key,
  //       'id': item['id'],
  //       'name': item['name'],
  //       'image': item['image'],
  //       'price': item['price'],
  //       'quantity': item['quantity'],
  //     };
  //   }).toList();
  //
  //   items = data.toList();
  //   print(items.length);
  //
  //   // Now you can use the 'data' list as needed
  // }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final clothAppCartBox = await Hive.openBox('cloth_app_cart');

    final data = clothAppCartBox.keys.map((key) {
      final item = clothAppCartBox.get(key);
      return {
        'key': key,
        'id': item['id'],
        'name': item['name'],
        'image': item['image'],
        'price': item['price'],
        'quantity': item['quantity'],
      };
    }).toList();

    return data;
  }

  double calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    double totalPrice = 0.0;
    for (final item in cartItems) {
      final price = double.parse(item['price']); // Convert price to double
      final quantity = item['quantity'] as int;  // Quantity is already int
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  Future<void> incrementCartItemQuantity(int cartItemKey) async {
    final clothAppCartBox = await Hive.openBox('cloth_app_cart');

  final item = await clothAppCartBox.get(cartItemKey) as Map<String, dynamic>;
    if (item != null) {
      final int currentQuantity = item['quantity'] as int;
      final double price = double.parse(item['price']); // Convert price to double
      final updatedItem = {
        ...item,
        'quantity': currentQuantity + 1,
      };
      await clothAppCartBox.put(cartItemKey, updatedItem);
      update(); // Notify GetX that the state has changed
    }
  }
  decrementCartItem(int index){

  }

  deleteAItem(int index){

  }
}