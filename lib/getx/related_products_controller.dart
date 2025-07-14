import 'package:get/get.dart';
import '../model/products_api_model.dart';

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
  }
}
