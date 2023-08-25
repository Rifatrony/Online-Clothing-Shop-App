import 'dart:async';

import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    addLoader();
  }

  Future<void> addLoader() async {
    isLoading.value = false;
    // Get.offAllNamed(RouteName.CUSTOMER_DASHBOARD_SCREEN);
    checkLogin();
    // Replace with your actual route name
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    final role = prefs.getString('role');
    final name = prefs.getString('name');
    print("Name is =================> $name");

    if (accessToken != null && role == "user") {
      Timer(const Duration(seconds: 3), () {
        Get.offAllNamed(RouteName.CUSTOMER_DASHBOARD_SCREEN);
      });
    }
    else if (accessToken != null && role == "admin") {
      Timer(const Duration(seconds: 2), () {
        Get.snackbar("Success", "Go to admin profile page");
      });
    }
    else{
      Get.offAllNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
    }
  }
}