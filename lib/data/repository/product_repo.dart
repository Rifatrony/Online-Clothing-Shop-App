import 'package:cloth_shop_app/data/remote_data_url.dart';
import '../api/network_api_services.dart';
import '../model/all_product_model.dart';
import '../model/product_details_model.dart';
import '../model/product_model.dart';

class ProductRepository {
  final apiServices = NetworkApiServices();
  Future<ProductModel> getLatestProduct() async {
    dynamic response  = await apiServices.getApiWithoutHeader(RemoteDataSource.latestProductUrl);
    return ProductModel.fromJson(response);
  }

  Future<AllProductModel> getAllProduct() async {
    dynamic response  = await apiServices.getApiWithoutHeader(RemoteDataSource.allProductUrl);
    print("Response from getAllProduct: $response");
    return AllProductModel.fromJson(response);
  }
  Future<ProductDetailsModel> getProductDetails(String id) async{
    dynamic response = await apiServices.getApi(RemoteDataSource.productDetailsUrl + id);
    return ProductDetailsModel.fromJson(response);
  }
}