import 'package:get/get.dart';
import '../error_handling/error_handling.dart';
import 'package:food_api_architecture/service/api_service.dart';
import 'package:food_api_architecture/model/products_api_model.dart';

class SearchProductController extends GetxController {
  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

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

      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) {
        errorMessage.value = 'No internet connection. Please check your network.';
        return;
      }

      final result = await ApiService.searchProducts(query);
      products.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Something went wrong while searching. Please try again.';
      ErrorHandler.showError(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
