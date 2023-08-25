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
                controller.phone.value.isEmpty
                    ? "Login to get phone number"
                    : controller.phone.value.toString(),
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
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/no_image.jpg"), fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Home"),
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
            controller.isLogin.value == true ? ListTile(
              leading: Icon(Icons.list_alt),
              title: Text("Order"),
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.CUSTOMER_ORDER_SCREEN);
              },
            ) : Container(),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text("Settings"),
              onTap: (){
                Navigator.pop(context);
                Get.toNamed(RouteName.CUSTOMER_SETTING_SCREEN);
              },
            ),
            controller.isLogin == false ? AppButton(onPress: (){}, title: "Login"):Container()
          ],
        ),
      ),
    );
  }
}
