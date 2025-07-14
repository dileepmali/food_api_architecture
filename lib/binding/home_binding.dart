import 'package:food_api_architecture/binding/random_product_binding.dart';
import 'package:food_api_architecture/getx/products_random.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRandomController());
  }
}
