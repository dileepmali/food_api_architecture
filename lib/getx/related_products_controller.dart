import 'package:get/get.dart';
import '../model/products_api_model.dart';
<<<<<<< HEAD

class RelatedProductsController extends GetxController {
  var relatedProducts = <ProductsApiModel>[].obs;

  void fetchRelatedProducts({
    required ProductsApiModel selectedProduct,
    required List<ProductsApiModel> allProducts,
  }) {
    final selectedTags = selectedProduct.tags.toSet();

    final related = allProducts.where((product) {
      if (product.title == selectedProduct.title) return false;
      final intersection = product.tags.toSet().intersection(selectedTags);
      return intersection.isNotEmpty;
    }).toList();

    relatedProducts.value = related;
=======
import '../repository/product_respository.dart';

class RelatedProductsController extends GetxController {
  final ProductRepository _repo = ProductRepository(); // ✅ Inject repo

  var relatedProducts = <ProductsApiModel>[].obs;

  Future<void> fetchRelatedProducts({
    required ProductsApiModel selectedProduct,
    required List<ProductsApiModel> allProducts,
  }) async {
    final result = await _repo.getRelatedProducts(
      selectedProduct: selectedProduct,
      allProducts: allProducts,
    );
    relatedProducts.value = result;
>>>>>>> 3906723 (Initial commit with full project)
  }
}
