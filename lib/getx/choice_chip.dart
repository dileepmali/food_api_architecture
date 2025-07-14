<<<<<<< HEAD
import 'package:food_api_architecture/error_handling/error_handling.dart' show ErrorHandler;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/products_api_model.dart';
import '../service/api_service.dart';

class ChoiceChipController extends GetxController {
=======
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../repository/product_respository.dart';

class ChoiceChipController extends GetxController {
  final ProductRepository _repo = ProductRepository();

>>>>>>> 3906723 (Initial commit with full project)
  var categories = <String>[].obs;
  var selectedCategory = 'All'.obs;
  var products = <ProductsApiModel>[].obs;
  List<ProductsApiModel> allProducts = [];
  var isLoading = false.obs;
<<<<<<< HEAD
  var errorMessage = ''.obs; // <-- ADD THIS LINE
=======
  var errorMessage = ''.obs;
>>>>>>> 3906723 (Initial commit with full project)

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
<<<<<<< HEAD
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
=======
      errorMessage.value = '';

      if (!await ErrorHandler.checkInternet()) {
        errorMessage.value = 'No internet connection';
        isLoading.value = false; // ✅ fix
        return;
      }

      final fetchedProducts = await _repo.getAllProducts();
      allProducts = fetchedProducts;

      products.clear();
      products.assignAll(fetchedProducts);

      final uniqueCategories = fetchedProducts.map((p) => p.category).toSet().toList();
      categories.assignAll(uniqueCategories.isEmpty ? ['All'] : ['All', ...uniqueCategories]);
      selectedCategory.value = 'All';

    } catch (e) {
      errorMessage.value = 'Failed to load products: $e';
      ErrorHandler.showError(errorMessage.value);
>>>>>>> 3906723 (Initial commit with full project)
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
<<<<<<< HEAD
    if (category == 'All') {
      products.assignAll(allProducts);
    } else {
      products.assignAll(allProducts.where((p) => p.category == category).toList());
    }
=======

    final filtered = category == 'All'
        ? allProducts
        : allProducts.where((p) => p.category == category).toList();

    products.clear();
    products.assignAll(filtered);
>>>>>>> 3906723 (Initial commit with full project)
  }
}
