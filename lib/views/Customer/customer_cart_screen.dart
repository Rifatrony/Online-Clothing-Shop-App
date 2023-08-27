import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_shop_app/controller/Customer/OrderController.dart';
import 'package:cloth_shop_app/controller/Customer/cart_controller.dart';
import 'package:cloth_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/values/constatnt_screen_size.dart';

class CustomerCartScreen extends StatelessWidget {
  const CustomerCartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    CartController cartController = Get.find();
    OrderController orderController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My Cart"),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: cartController.getCartItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final cartItems = snapshot.data!;
                  final totalPrice = cartController.calculateTotalPrice(cartItems);
                  return Container(

                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.redAccent.shade400,
                    ),
                    child: Center(
                      child: Text(
                          'Total Price: $totalPrice',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          )
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              future: cartController.getCartItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final cartItems = snapshot.data!;
                  return ListView.builder(
                    itemCount: cartItems.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(ScreenSize.radius16),
                            topRight: Radius.circular(ScreenSize.radius16),
                            topLeft: Radius.circular(ScreenSize.radius16),
                            bottomLeft: Radius.circular(ScreenSize.radius16),
                          ),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10,),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(ScreenSize.radius10),
                            child: CachedNetworkImage(
                              height: 300,
                              width: 80,
                              alignment: Alignment.topCenter,
                              imageUrl: item['image'],
                              progressIndicatorBuilder: (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              // placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(item['key'].toString()),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(item['quantity'].toString()),
                                  Text(
                                    " X ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(item['price'].toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      cartController.incrementCartItemQuantity(item['key']);
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Customize the UI as needed
                        ),
                      );
                    },
                  );
                }
              },
            ),

            AppButton(
              onPress: (){
                orderController.checkLogin();
              },
              title: "Checkout",
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _refresh() async {
    // Call here a function that will used to call for get data from API.
    // return callAllApi();
    return callApi();

  }
  Future<void> callApi() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.find<CartController>().getCartItems();
  }
}
