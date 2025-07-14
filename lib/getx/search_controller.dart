import 'package:get/get.dart';
<<<<<<< HEAD
import '../error_handling/error_handling.dart';
import 'package:food_api_architecture/service/api_service.dart';
import 'package:food_api_architecture/model/products_api_model.dart';

class SearchProductController extends GetxController {
  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

=======
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../repository/product_respository.dart';

class SearchProductController extends GetxController {
  final ProductRepository _repo = ProductRepository();

  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
>>>>>>> 3906723 (Initial commit with full project)
  final String defaultQuery;

  SearchProductController({this.defaultQuery = ''});

  @override
  void onInit() {
    super.onInit();
    if (defaultQuery.trim().isNotEmpty) {
      searchNewProducts(defaultQuery.trim());
    }
  }

  Future<void> searchNewProducts(String query) async {
    if (query.trim().isEmpty) {
      products.clear();
      errorMessage.value = '';
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

<<<<<<< HEAD
      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) {
        errorMessage.value = 'No internet connection. Please check your network.';
        return;
      }

      final result = await ApiService.searchProducts(query);
      products.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Something went wrong while searching. Please try again.';
=======
      if (!await ErrorHandler.checkInternet()) {
        errorMessage.value = 'No internet connection';
        isLoading.value = false; // ✅ fix
        return;
      }

      final result = await _repo.searchProducts(query);

      if (result.isEmpty) {
        errorMessage.value = 'No products matched your search.';
      }

      products.clear();
      products.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Search failed: $e';
>>>>>>> 3906723 (Initial commit with full project)
      ErrorHandler.showError(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
