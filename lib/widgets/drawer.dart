import 'package:cloth_shop_app/controller/Customer/cart_controller.dart';
import 'package:cloth_shop_app/controller/login_controller.dart';
import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:cloth_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    CartController cartController = Get.find();
    return Drawer(
      child: Obx(()=>
          ListView(
          padding: EdgeInsets.zero,
          children:  [
            UserAccountsDrawerHeader(
              accountName: Text(
                controller.name.value.isEmpty
                    ? "Please Login First"
                    : controller.name.value.toString(),
                style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),

              ),
              accountEmail: Text(
                controller.phone.value == null
                    ? "Login to get phone number"
                    : "0${controller.phone.value}",
                style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("assets/images/no_image.jpg", height: 40, width: 40, fit: BoxFit.cover,),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/no_image.jpg"), fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.CUSTOMER_DASHBOARD_SCREEN);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text("Cart"),
              trailing: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: cartController.getCartItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final cartItems = snapshot.data!;
                        return Text(
                          cartItems.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.CUSTOMER_CART_SCREEN);
              },
            ),
            controller.accessToken.value != ""
                ? ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text("Order"),
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.CUSTOMER_ORDER_SCREEN);
              },
            ) : Container(),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.CUSTOMER_SETTING_SCREEN);
              },
            ),
            controller.accessToken == ''
                ? AppButton(
                    onPress: () async {
                      Navigator.pop(context);
                      await Get.toNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
                    }, title: "Login",
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
