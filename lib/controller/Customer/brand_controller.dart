import 'package:get/get.dart';

import '../../data/model/brand_model.dart';
import '../../data/model/brand_model2.dart';
import '../../data/repository/brand_repository.dart';

class BrandController extends GetxController{
  final repository = BrandRepository();
  // final products = <Product>[].obs;
  // List<Product>? products = <Product>[];
  List<Brand>? brand = <Brand>[];
  // final brand = BrandModel().obs;
  final loading = false.obs;
  final brandLoading = false.obs;

  void setLoading(bool value) {
    loading.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    // getBrand();
    getAllBrand();
  }

  // Future<void> getBrand() async {
  //   setLoading(true);
  //   try {
  //     repository.getBrand().then((value) {
  //       print("===============> ${value.products![1].title}");
  //       products!.addAll(value.products!);
  //       setLoading(false);
  //       update();
  //     }).onError((error, stackTrace) {
  //       setLoading(false);
  //     });
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  Future<void> getAllBrand() async {
    brandLoading(true);
    try {
      repository.getAllBrand().then((value) {
        brand!.clear();
        brand!.addAll(value.brand!);
        brandLoading(false);
        update();
      }).onError((error, stackTrace) {
        brandLoading(false);
        Get.snackbar("Error", error.toString());
        update();
      });
    } catch (e) {
      brandLoading.value = false;
      Get.snackbar("Error", e.toString());
      update();
    }
  }

}