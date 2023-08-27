import 'package:get/get.dart';

import '../../controller/Customer/customer_product_details_controller.dart';
import '../../controller/Customer/product_controller.dart';

class ProductDetailsBinding implements Bindings{
  @override
  void dependencies() async {
    Get.lazyPut(() => CustomerProductDetailsController());
  }
}