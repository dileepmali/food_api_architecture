import 'package:get/get.dart';
import '../getx/products_random.dart';

class RandomProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRandomController());
  }
}
