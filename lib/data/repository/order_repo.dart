import '../api/network_api_services.dart';
import '../model/delivery_charge_model.dart';
import '../remote_data_url.dart';

class OrderRepo {
  final apiServices = NetworkApiServices();
  Future<DeliveryChargeModel> getDeliveryCharge() async {
    dynamic response  = await apiServices.getApi(RemoteDataSource.deliveryChargeUrl);
    return DeliveryChargeModel.fromJson(response);
  }
}