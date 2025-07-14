import 'package:get/get.dart';
import '../getx/search_controller.dart';

class SearchProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchProductController());
  }
}
