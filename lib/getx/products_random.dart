import 'package:get/get.dart';
import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../service/api_service.dart';

class ProductRandomController extends GetxController {
  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchRandomProduct() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) {
        errorMessage.value = 'No internet connection. Please check your network.';
        return;
      }

      final result = await ApiService.getRandomProducts();
      products.assignAll(result);

    } catch (e) {
      errorMessage.value = 'Failed to load product. Please try again later.';
      ErrorHandler.showError(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
