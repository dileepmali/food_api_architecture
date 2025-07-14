import 'package:get/get.dart';
import '../getx/choice_chip.dart';

class ChoiceChipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChoiceChipController());
  }
}
