import 'package:get/get.dart';
<<<<<<< HEAD
import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../service/api_service.dart';

class AllProductsController extends GetxController {
  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
=======
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../repository/product_respository.dart';

class AllProductsController extends GetxController {
  final ProductRepository _repo = ProductRepository();

  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
>>>>>>> 3906723 (Initial commit with full project)

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
<<<<<<< HEAD

      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) return;

      final allProducts = await ApiService.getAllProducts();
      products.assignAll(allProducts);
    } catch (e) {
      ErrorHandler.showError('Something went wrong: $e');
=======
      errorMessage.value = '';

      final isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) {
        errorMessage.value = 'No internet connection';
        isLoading.value = false;
        return;
      }

      final allProducts = await _repo.getAllProducts();
      if (allProducts.isEmpty) {
        errorMessage.value = 'No products available';
      }

      products.clear();
      products.assignAll(allProducts);
    } catch (e) {
      errorMessage.value = 'Something went wrong: $e';
      ErrorHandler.showError(errorMessage.value);
>>>>>>> 3906723 (Initial commit with full project)
    } finally {
      isLoading.value = false;
    }
  }
}
