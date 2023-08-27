import 'package:cloth_shop_app/controller/Customer/OrderController.dart';
import 'package:cloth_shop_app/controller/Customer/brand_controller.dart';
import 'package:cloth_shop_app/controller/Customer/cart_controller.dart';
import 'package:cloth_shop_app/controller/Customer/customer_product_details_controller.dart';
import 'package:cloth_shop_app/controller/login_controller.dart';
import 'package:cloth_shop_app/controller/splash_controller.dart';
import 'package:get/get.dart';

import '../controller/Customer/product_controller.dart';

class InitController implements Bindings{
  @override
  void dependencies() async {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => CustomerProductDetailsController());
    Get.lazyPut(() => BrandController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => OrderController());
  }
}