import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloth_shop_app/Core/values/app_color.dart';
import 'package:cloth_shop_app/controller/Customer/brand_controller.dart';
import 'package:cloth_shop_app/controller/Customer/customer_product_details_controller.dart';
import 'package:cloth_shop_app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/values/constatnt_screen_size.dart';
import '../../controller/Customer/product_controller.dart';
import '../../widgets/drawer.dart';
import '../../widgets/title_with_arrow.dart';
import 'package:get/get.dart';

class CustomerDashboardScreen extends StatelessWidget {
  const CustomerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CustomerProductDetailsController controller = Get.find();
    BrandController brandController = Get.find();
    ProductController productController = Get.find();

    return Scaffold(
      drawer: const CustomerDrawer(),
      appBar: AppBar(
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "A Great",
                    textAlign: TextAlign.left ,
                    style: GoogleFonts.dancingScript(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Shop quality product",
                    textAlign: TextAlign.left ,
                    style: GoogleFonts.dancingScript(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const TitleWithArrow(title: "Popular Brand",),
              Obx(() => brandController.brandLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: ScreenSize.height90,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.only(left: ScreenSize.width8, right: ScreenSize.width8,),
                          scrollDirection: Axis.horizontal,
                          itemCount: brandController.brand!.length,
                          itemBuilder: (context, index){
                            return Container(
                              margin: EdgeInsets.only(left: ScreenSize.width10, right: ScreenSize.width10),
                              child: Column(
                                children: [
                                  Container(
                                    height: ScreenSize.height60,
                                    width: ScreenSize.width60,
                                    child: brandController.brand![index].image == null 
                                        ? Image.asset("assets/images/no_image.jpg")
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(ScreenSize.radius16),
                                          child: CachedNetworkImage(
                                              height: ScreenSize.height150,
                                              width: double.maxFinite,
                                              imageUrl: brandController.brand![index].image.toString(),
                                              progressIndicatorBuilder: (context, url, progress) => Center(
                                                child: CircularProgressIndicator(
                                                  value: progress.progress,
                                                ),
                                              ),
                                              // placeholder: (context, url) => CircularProgressIndicator(),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                        ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Center(
                                    child: Text(
                                      brandController.brand![index].name!.isEmpty ? "" : brandController.brand![index].name.toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                      ),
                    ),
              ),

              const TitleWithArrow(title: "Popular Category",),

              SizedBox(
                height: 102,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: ScreenSize.width8, right: ScreenSize.width10,),
                    scrollDirection: Axis.horizontal,
                    itemCount: 9,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(left: ScreenSize.width10, right: ScreenSize.width10),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(ScreenSize.radius16),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/no_image.jpg",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: ScreenSize.height5,),
                            Center(
                              child: Text(
                                "INDEX ${index + 1}",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),

              const TitleWithArrow(title: "Special Offer",),
              Container(
                height: 120,
                width: double.maxFinite,
                color: Colors.red,
              ),


              const TitleWithArrow(title: "Latest Product",),

              Obx(() => productController.loading.value
                  ? CircularProgressIndicator()
              : SizedBox(
                height: 150,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: ScreenSize.width8, right: ScreenSize.width10,),
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.latestProducts!.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(left: ScreenSize.width10, right: ScreenSize.width10),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 100,
                              child: productController.latestProducts![index].image == null
                                  ? Image.asset("assets/images/no_image.jpg")
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(ScreenSize.radius16),
                                child: CachedNetworkImage(
                                  height: ScreenSize.height150,
                                  width: double.maxFinite,
                                  imageUrl:  productController.latestProducts![index].image![0].image.toString(),
                                  progressIndicatorBuilder: (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),
                                  // placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                  productController.latestProducts![index].name.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),),

              const TitleWithArrow(title: "All Product",),
              Obx(() =>
                  productController.allLoading.value
                      ? const CircularProgressIndicator()
                      : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: ScreenSize.width10, right: ScreenSize.width10, bottom: ScreenSize.height10),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: productController.allProducts!.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: ScreenSize.width10 / ScreenSize.height17,
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(RouteName.getProductDetails(index, productController.allProducts![index].id.toString()));
                        },
                        child: Card(
                          shadowColor: Colors.grey.shade200,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(ScreenSize.radius16),
                              topRight: Radius.circular(ScreenSize.radius16),
                              topLeft: Radius.circular(ScreenSize.radius16),
                              bottomLeft: Radius.circular(ScreenSize.radius16),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(ScreenSize.radius16),
                                child: CachedNetworkImage(
                                  height: ScreenSize.height150,
                                  width: double.maxFinite,
                                  imageUrl:  productController.allProducts![index].image![0].image.toString(),
                                  progressIndicatorBuilder: (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),
                                  // placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: ScreenSize.height45,
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2,),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    productController.allProducts![index].name.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: ScreenSize.height25,
                                padding: EdgeInsets.only(left: ScreenSize.width8, right: ScreenSize.width8, top: 2, bottom: 2,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(productController.allProducts![index].price.toString()),
                                    Text(
                                      productController.allProducts![index].discountPrice!.toStringAsFixed(2).toString(),
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: ScreenSize.height50 ?? 50,
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 5,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "4.3",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage("assets/images/star.png",),),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        print("click cart ${index + 1}");
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.whiteColor,
                                        ),
                                        child: const Icon(Icons.shopping_cart_outlined),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    // Call here a function that will used to call for get data from API.
    // return callAllApi();
    return callApi();

  }
  Future<void> callApi() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.find<BrandController>().getAllBrand();
    Get.find<ProductController>().getLatestProduct();
    Get.find<ProductController>().getAllProduct();
  }
}
