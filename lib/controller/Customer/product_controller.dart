import 'package:cloth_shop_app/data/model/all_product_model.dart';
import 'package:get/get.dart';

import '../../data/model/product_details_model.dart';
import '../../data/model/product_model.dart' as latestProduct;
import '../../data/model/all_product_model.dart' as allProduct;
import '../../data/repository/product_repo.dart';

class ProductController extends GetxController{
  final repository = ProductRepository();
  List<latestProduct.Product>? latestProducts = [];
  List<allProduct.Product>? allProducts = [];
  final productDetails = ProductDetailsModel().obs;

  final loading = false.obs;
  final allLoading = false.obs;
  final detailsLoading = false.obs;

  void setLoading(bool value) {
    loading.value = value;
  }
  void setAllLoading(bool value) {
    allLoading.value = value;
  }

  void setProductDetails(ProductDetailsModel value) {
    productDetails.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getLatestProduct();
    getAllProduct();
  }

  Future<void> getLatestProduct() async {
    setLoading(true);
    try {
      repository.getLatestProduct().then((value) {
        latestProducts!.clear();
        latestProducts!.addAll(value.product!);
        setLoading(false);
        update();
      }).onError((error, stackTrace) {
        setLoading(false);
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> getAllProduct() async {
    setAllLoading(true);
    try {
      repository.getAllProduct().then((value) {
        allProducts!.clear();
        allProducts!.addAll(value.product!);
        setAllLoading(false);
        update();
      }).onError((error, stackTrace) {
        setAllLoading(false);
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
      allLoading.value = false;
    }
  }

  Future<void> getProductDetails(String id) async {
    detailsLoading(true);
    repository.getProductDetails(id).then((value) {
      setProductDetails(value);
      detailsLoading(false);
      update();
    }).onError((error, stackTrace) {
      detailsLoading(false);
    });
  }
}