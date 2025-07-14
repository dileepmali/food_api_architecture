import 'package:food_api_architecture/error_handling/error_handling.dart' show ErrorHandler;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/products_api_model.dart';
import '../service/api_service.dart';

class ChoiceChipController extends GetxController {
  var categories = <String>[].obs;
  var selectedCategory = 'All'.obs;
  var products = <ProductsApiModel>[].obs;
  List<ProductsApiModel> allProducts = [];
  var isLoading = false.obs;
  var errorMessage = ''.obs; // <-- ADD THIS LINE

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = ''; // Reset before call

      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) {
        errorMessage.value = 'No internet connection';
        return;
      }

      final fetchedProducts = await ApiService.getAllProducts();
      allProducts = fetchedProducts;
      products.assignAll(fetchedProducts);

      final uniqueCategories = fetchedProducts.map((p) => p.category).toSet().toList();
      categories.assignAll(['All', ...uniqueCategories]);
      selectedCategory.value = 'All';
    } catch (e) {
      errorMessage.value = 'Failed to load products: $e';
      ErrorHandler.showError('Failed to load products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      products.assignAll(allProducts);
    } else {
      products.assignAll(allProducts.where((p) => p.category == category).toList());
    }
  }
}
