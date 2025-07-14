import 'package:get/get.dart';
import '../error_handling/error_handling.dart';
import '../model/products_api_model.dart';
import '../service/api_service.dart';

class AllProductsController extends GetxController {
  var products = <ProductsApiModel>[].obs;
  var isLoading = false.obs;

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;

      bool isConnected = await ErrorHandler.checkInternet();
      if (!isConnected) return;

      final allProducts = await ApiService.getAllProducts();
      products.assignAll(allProducts);
    } catch (e) {
      ErrorHandler.showError('Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
