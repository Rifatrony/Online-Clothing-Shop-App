import 'package:cloth_shop_app/data/remote_data_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/network_api_services.dart';

class LoginRepo {
  final apiServices = NetworkApiServices();
  Future<dynamic> login(dynamic data) async {
    dynamic response  = await apiServices.loginApi(data, RemoteDataSource.loginUrl);
    return response;
  }
  Future<bool> saveUser(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("access_token", token);
    return true;
  }
  Future<bool> saveUserRole(String role) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("role", role);
    return true;
  }

  Future<bool> saveUserName(String name) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("name", name);
    return true;
  }

  Future<bool> saveUserPhone(int phone) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("phone", phone);
    return true;
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? accessToken = sp.getString("access_token");
    return accessToken;
  }
  Future<String?> getRole() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? role = sp.getString("role");
    return role;
  }
  Future<String?> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? name = sp.getString("name");
    return name;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}