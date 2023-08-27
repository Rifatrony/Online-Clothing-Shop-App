import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:cloth_shop_app/views/Customer/customer_cart_screen.dart';
import 'package:cloth_shop_app/views/Customer/customer_checkout_screen.dart';
import 'package:cloth_shop_app/views/Customer/customer_dashboard_screen.dart';
import 'package:cloth_shop_app/views/Customer/customer_login_screen.dart';
import 'package:cloth_shop_app/views/Customer/customer_order_screen.dart';
import 'package:cloth_shop_app/views/Customer/customer_product_details.dart';
import 'package:cloth_shop_app/views/Customer/customer_registration_screen.dart';
import 'package:cloth_shop_app/views/Customer/customer_settings_screen.dart';
import 'package:get/get.dart';

import '../binding/Customer/product_details_binding.dart';
import '../views/Screens/splash_screen.dart';

class Pages {
  String id = "";
  static final List<GetPage> pages = [
    GetPage(
      name: RouteName.HOME,
      page: ()=> const SplashScreen(),
    ),
    GetPage(
      name: RouteName.SPLASH_SCREEN,
      page: ()=> const SplashScreen(),
    ),
    GetPage(
      name: RouteName.CUSTOMER_LOGIN_SCREEN,
      page: ()=> const CustomerLoginScreen(),
    ),
    GetPage(
      name: RouteName.CUSTOMER_REGISTRATION_SCREEN,
      page: ()=> const CustomerRegistrationScreen(),
    ),

    GetPage(
      name: RouteName.CUSTOMER_DASHBOARD_SCREEN,
      page: ()=> const CustomerDashboardScreen(),
    ),

    GetPage(
      name: RouteName.CUSTOMER_PRODUCT_DETAILS_SCREEN,
      page: (){
        var index = Get.parameters['index'];
        var id = Get.parameters['id'];
        return CustomerProductDetailsScreen(index: int.parse(index!), id: id!);
      },
      binding: ProductDetailsBinding(),
    ),

    GetPage(
      name: RouteName.CUSTOMER_CART_SCREEN,
      page: ()=> const CustomerCartScreen(),
    ),

    GetPage(
      name: RouteName.CUSTOMER_CHECKOUT_SCREEN,
      page: ()=> const CustomerCheckoutScreen(),
    ),

    GetPage(
      name: RouteName.CUSTOMER_SETTING_SCREEN,
      page: ()=> const CustomerSettingsScreen(),
    ),

    GetPage(
      name: RouteName.CUSTOMER_ORDER_SCREEN,
      page: ()=> const CustomerOrderScreen(),
    ),
  ];
}