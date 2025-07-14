import 'package:get/get.dart';
<<<<<<< HEAD
import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../service/api_service.dart';

class ProductRandomController extends GetxController {
=======
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../repository/product_respository.dart';

class ProductRandomController extends GetxController {
  final ProductRepository _repo = ProductRepository();

>>>>>>> 3906723 (Initial commit with full project)
  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchRandomProduct() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

<<<<<<< HEAD
      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) {
        errorMessage.value = 'No internet connection. Please check your network.';
        return;
      }

      final result = await ApiService.getRandomProducts();
      products.assignAll(result);

    } catch (e) {
      errorMessage.value = 'Failed to load product. Please try again later.';
=======
      if (!await ErrorHandler.checkInternet()) {
        errorMessage.value = 'No internet connection';
        isLoading.value = false;
        return;
      }

      final result = await _repo.getRandomProducts();

      if (result.isEmpty) {
        errorMessage.value = 'No products found';
      }

      products.clear();
      products.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Failed to load product.';
>>>>>>> 3906723 (Initial commit with full project)
      ErrorHandler.showError(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
