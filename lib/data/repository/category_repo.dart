import 'package:cloth_shop_app/data/api/network_api_services.dart';
import 'package:cloth_shop_app/data/model/category_model.dart';
import 'package:cloth_shop_app/data/remote_data_url.dart';

class CategoryRepo {
  final apiServices = NetworkApiServices();
  Future<CategoryModel> getCategory() async {
    dynamic response = await apiServices.getApiWithoutHeader(RemoteDataSource.categoryUrl);
    return CategoryModel.fromJson(response);
  }
}