import 'package:get/get.dart';
import '../getx/choice_chip.dart';
import '../getx/search_controller.dart';

class AllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoiceChipController());
    Get.lazyPut(() => SearchProductController());
  }
}
