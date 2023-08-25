import 'package:cloth_shop_app/controller/login_controller.dart';
import 'package:cloth_shop_app/init/init_controller.dart';
import 'package:cloth_shop_app/routes/pages.dart';
import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:cloth_shop_app/views/Customer/customer_login_screen.dart';
import 'package:cloth_shop_app/views/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/Customer/cart_controller.dart';
import 'controller/Customer/product_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("cloth_app_cart");
  // Get.lazy(ProductController());
  // Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitController(),
      title: 'Cloth APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.SPLASH_SCREEN, // Set initial route
      getPages: Pages.pages,
      home: const SplashScreen(),
    );
  }
}

