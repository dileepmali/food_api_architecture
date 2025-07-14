import 'package:get/get.dart';
import '../getx/related_products_controller.dart';

class RelatedProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelatedProductsController());
  }
}
