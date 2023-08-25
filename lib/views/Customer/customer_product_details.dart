import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloth_shop_app/Core/values/app_color.dart';
import 'package:cloth_shop_app/controller/Customer/brand_controller.dart';
import 'package:cloth_shop_app/controller/Customer/cart_controller.dart';
import 'package:cloth_shop_app/controller/Customer/customer_product_details_controller.dart';
import 'package:cloth_shop_app/controller/Customer/product_controller.dart';
import 'package:cloth_shop_app/data/remote_data_url.dart';
import 'package:cloth_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomerProductDetailsScreen extends StatelessWidget {
  int? index;
  String? id;
  CustomerProductDetailsScreen({super.key, required this.index, required this.id,});

  @override
  Widget build(BuildContext context) {
    // final String id = Get.arguments as String;
    // print("======================= ID is ==================== $id");

    CustomerProductDetailsController controller = Get.find();
    CartController cartController = Get.find();
    var product = Get.find<ProductController>().allProducts![index!];
    Get.find<ProductController>().getAllProduct();

    // var product = Get.find<ProductController>().getProductDetails(id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            product.image!.isEmpty
                ? Container()
                : Stack(
              clipBehavior: Clip.none,
              children: [
                CarouselSlider.builder(
                  carouselController: controller.carouselController,
                  itemCount: product.image!.length,
                  itemBuilder: (context, index, realIndex){
                    final imageUrl = product.image![index].image.toString();
                    return buildImage(imageUrl, index);
                  }, options: CarouselOptions(
                    height: 220,
                    viewportFraction: 1.0, // Set this to 1.0 to show one image at a time
                    aspectRatio: 16 / 9,
                    // autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason){
                      controller.activeIndex.value = index;
                    }
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  left: 0,
                  child: Center(child: buildIndicator(index!)),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 35,
                  child: GestureDetector(
                    onTap: (){
                      controller.previous();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 35,
                  child: GestureDetector(
                    onTap: (){
                      controller.next();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Card(
              margin: EdgeInsets.only(top: 20, left: 16, right: 16,),
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Center(child: Text("Product Name",)),),
            ),
            const Card(
              margin: EdgeInsets.only(top: 20, left: 16, right: 16,),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Product Description",
                  ),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16,),
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Container(
                height: 300,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Product Review Section",
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onPress: () {
          String id  = cartController.id.value = product.id.toString();
          String name  = cartController.name.value = product.name.toString();
          String image  = cartController.image.value = product.image![0].image.toString();
          String price  = cartController.price.value = product.price.toString();
          // int quantity  = cartController.quantity.value;
          cartController.addToCart(id, name, image, price);
          // print("==============Id is==============${product.id}");
        },
        title: 'Add to cart',
      ),
    );
  }
  Widget buildImage(String imageUrl, int index) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      // placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );

  Widget buildIndicator(int index) => Obx(() => AnimatedSmoothIndicator(
    activeIndex: Get.find<CustomerProductDetailsController>().activeIndex.value,
    count: Get.find<ProductController>().allProducts![index].image!.length,
    effect: ExpandingDotsEffect(
      dotHeight: 8,
      dotWidth: 10,
      dotColor: Colors.teal.shade100,
      activeDotColor: Colors.red,
    ),
  ),

  );
}
