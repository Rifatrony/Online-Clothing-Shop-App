import 'package:cloth_shop_app/controller/Customer/cart_controller.dart';
import 'package:cloth_shop_app/data/model/delivery_charge_model.dart';
import 'package:cloth_shop_app/data/repository/order_repo.dart';
import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text_form_field.dart';
import '../login_controller.dart';

class OrderController extends GetxController{

  final repository = OrderRepo();

  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  RxBool isCompleted = false.obs;

  LoginController loginController = Get.find();
  CartController cartController = Get.find();

  RxInt activeStepIndex = 0.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<Datum>? deliveryList = [];


  final item = ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'];

  RxBool isOnlinePayment = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedItemId = ''.obs;
  Datum? selectedCategory;
  final deliveryCharge = "".obs;

  @override
  void onInit() {
    super.onInit();
    getDeliveryCharge();
  }

  checkLogin() {
    if(loginController.accessToken.value != ''){
      print("-------------Token Found-------------");
      Get.toNamed(RouteName.CUSTOMER_CHECKOUT_SCREEN);
    }
    else{
      print('----------- Token not found---------------');
      Get.snackbar("Warning", "Login First");
      Get.toNamed(RouteName.CUSTOMER_LOGIN_SCREEN);
    }
  }

  Future<void> getDeliveryCharge() async  {
    isLoading(true);
    try {
      repository.getDeliveryCharge().then((value) {
        deliveryList!.clear();
        deliveryList!.addAll(value.data!);
        isLoading(false);
        update();
      }).onError((error, stackTrace) {
        isLoading(false);
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }


}