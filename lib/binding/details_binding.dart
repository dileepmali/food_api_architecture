import 'package:get/get.dart';
import '../getx/choice_chip.dart';
import '../getx/related_products_controller.dart';
import '../getx/search_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RelatedProductsController());
    Get.lazyPut(() => ChoiceChipController());
    Get.lazyPut(() => SearchProductController());
  }
}
