import 'package:get/get.dart';
import '../binding/all_products_binding.dart';
import '../binding/details_binding.dart';
import '../binding/home_binding.dart';
import '../screen/home_screen.dart';
import '../screen/All_products_screen.dart';
import '../screen/details_screen.dart';
import '../screen/filter_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => Home_Screen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.allProducts,
      page: () => AllProducts(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.details,
      page: () => DetailsScreen(),
      binding: DetailsBinding(), // यदि controller है तो
    ),
    GetPage(
      name: AppRoutes.filter,
      page: () => FilterScreen(),
      // binding: FilterBinding(), // यदि controller है तो
    ),
  ];
}
