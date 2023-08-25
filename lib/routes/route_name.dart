abstract class RouteName {
  static const HOME = '/home';
  static const SPLASH_SCREEN = '/splash_screen';

  /// Customer Routes
  static const CUSTOMER_LOGIN_SCREEN = '/customer-login-screen';
  static const CUSTOMER_REGISTRATION_SCREEN = '/customer-registration-screen';
  static const CUSTOMER_DASHBOARD_SCREEN = '/customer-dashboard-screen';

  static const CUSTOMER_PRODUCT_DETAILS_SCREEN = '/customer-product-details-screen';
  static String getProductDetails(int index, String id) => '${RouteName.CUSTOMER_PRODUCT_DETAILS_SCREEN}?index=$index&id=$id';

  static const CUSTOMER_CART_SCREEN = '/customer-cart-screen';
  static const CUSTOMER_SETTING_SCREEN = '/customer-settings-screen';
  static const CUSTOMER_ORDER_SCREEN = '/customer-order-screen';
// Add more route names here
}