import 'package:cloth_shop_app/data/remote_data_url.dart';
import '../api/network_api_services.dart';
import '../model/brand_model2.dart' as brand2;
import '../model/brand_model.dart' as brand;

class BrandRepository {
  final apiServices = NetworkApiServices();
  Future<brand2.BrandModel> getAllBrand() async {
    dynamic response  = await apiServices.getApiWithoutHeader(RemoteDataSource.brandUrl);
    return brand2.BrandModel.fromJson(response);
  }

  // Future<brand.BrandModel> getBrand() async {
  //   dynamic response  = await apiServices.getApiWithoutHeader("https://dummyjson.com/products");
  //   return brand.BrandModel.fromJson(response);
  // }
}