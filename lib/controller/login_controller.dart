import 'dart:async';

import 'package:cloth_shop_app/data/repository/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/utils/show_custom_loader.dart';
import '../routes/route_name.dart';

class LoginController extends GetxController{

  LoginRepo loginRepo = LoginRepo();

  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailOrPhoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  RxBool isLogin = false.obs;

  RxBool isLoading = false.obs;
  RxBool isPasswordHidden = true.obs;
  RxString name = 'No name'.obs;
  RxString phone = 'No number found'.obs;

  @override
  void onInit() {
    super.onInit();
    getName();
    getPhone();
  }

  Future<void> loginUser() async {

    if(emailOrPhoneController.text.toString().isEmpty){
      Get.snackbar("Warning", "Email/ Phone is required");
    }
    else if(passwordController.text.toString().isEmpty){
      Get.snackbar("Warning", "Password is required");
    }

    else if(passwordController.text.toString().length < 6){
      Get.snackbar("Warning", "Minimum Password is 6");
    }

    else{
      try{
        isLoading(true);
        Map data = {
          "phone": emailOrPhoneController.text.toString().trim(),
          "password": passwordController.text.toString().trim(),
        };
        loginRepo.login(data).then((value) {
          if (value['message'] == "Login Successful" && value["role"] == "user") {
            Get.offAllNamed(RouteName.CUSTOMER_DASHBOARD_SCREEN);
            isLoading(false);
            isLogin.value = true;
            Get.snackbar("Success", "Login Successful");
            loginRepo.saveUser(value["access_token"],);
            loginRepo.saveUserRole(value["role"],);
            loginRepo.saveUserName(value['user']['name'],);
            loginRepo.saveUserPhone(value['user']['phone'],);
            update();
          }

          else if (value['message'] == "Phone not found") {
            Get.snackbar("Warning", "Phone number not found");
            isLoading(false);
            update();
          }

          else if (value['message'] == "Authentication Failed: Incorrect password.") {
            Get.snackbar("Warning", "Authentication Failed: Incorrect password.");
            isLoading(false);
            update();
          }
          if (value['message'] == "Login Successful" && value["role"] == "admin") {
            // Login success
            // Save user info to shared preference
            // Go to customer dashboard page
            // Get.offAllNamed(RouteName.CUSTOMER_DASHBOARD_SCREEN);
            isLoading(false);
            Get.snackbar("Success", "Admin Login Successful");
            // loginRepo.saveUser(value["access_token"], value["role"], value['user']['name'], value['user']['phone']);
            print("Name is ========================== "+value['user']['name']+"\n\n ${value['role']}" );
            update();
          }

          else {
            // Login error
            isLoading.value = false;
          }
        });
      }catch(e){
        // print e
        isLoading(false);
      }
    }
  }

  Future<void> logout() async {
    try{
      loginRepo.removeUser().then((value) {
        Get.offAllNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
        Get.snackbar("Successful", "User Logged out");
      });
    } catch(e){
      Get.snackbar("Warning", e.toString());
    }
  }

  Future<String?> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name.value = sp.getString("name")!;
    return name.value;
  }
  Future<String?> getPhone() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    phone.value = sp.getString("phone")!;
    return phone.value;
  }

}