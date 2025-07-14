import 'package:get/get.dart';
import '../screen/All_products.dart';
import '../screen/details_Screen.dart';
import '../screen/filter_screen.dart';
import '../screen/home_screen.dart';

class AppRoutes{

  static const String allProductList = '/allProductList';
  static const String allProducts = '/allProducts';
  static const String detailsScreen = '/detailsScreen';
  static const String filterScreen = '/filterScreen';

  static final routes = [

    GetPage(name: allProductList, page: () => Home_Screen(),),
    GetPage(name: allProducts, page: () => AllProducts(),),
    GetPage(name: detailsScreen, page: () => DetailsScreen(),),
    GetPage(name: filterScreen, page: () => FilterScreen(),),

  ];
}