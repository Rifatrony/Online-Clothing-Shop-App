class RemoteDataSource{
  static const baseUrl = 'http://192.168.0.125:5000/api/v1';
  static const loginUrl = '$baseUrl/customer/login';
  static const registrationUrl = '$baseUrl/customer/registration';
  static const brandUrl = '$baseUrl/customer/brand';
  static const categoryUrl = '$baseUrl/customer/category';
  static const noticeUrl = '$baseUrl/customer/registration';
  static const latestProductUrl = '$baseUrl/product/latest-product';
  static const allProductUrl = '$baseUrl/customer/product';
  static const productDetailsUrl = '$baseUrl/customer/product/';
}