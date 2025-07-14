import 'dart:math';
import '../model/products_api_model.dart';
import '../service/api_service.dart'; // ✅ Use this

class ProductRepository {
  List<ProductsApiModel>? _cachedProducts;

  /// ✅ Get All Products (From ApiService with Cache)
  Future<List<ProductsApiModel>> getAllProducts() async {
    if (_cachedProducts != null) return _cachedProducts!;
    try {
      final result = await ApiService.getAllProducts();
      _cachedProducts = result;
      print("Fetched Products Count (from ApiService): ${result.length}");
      return result;
    } catch (e) {
      print("Error in getAllProducts: $e");
      return [];
    }
  }

  /// 🔁 Get Products With Pagination
  Future<List<ProductsApiModel>> getPagedProducts({int limit = 10, int skip = 0}) async {
    try {
      final result = await ApiService.getAllProducts();
      final paged = result.skip(skip).take(limit).toList();
      return paged;
    } catch (e) {
      return [];
    }
  }

  /// 🔍 Search Products
  Future<List<ProductsApiModel>> searchProducts(String query) async {
    try {
      return await ApiService.searchProducts(query);
    } catch (e) {
      return [];
    }
  }

  /// 🧠 Filter and Sort
  Future<List<ProductsApiModel>> getFilteredProducts({
    String? category,
    String? brand,
    double? maxPrice,
    String? sortBy,
  }) async {
    final products = await getAllProducts();

    List<ProductsApiModel> filtered = products.where((product) {
      final matchCategory = category == null || product.category == category;
      final matchBrand = brand == null || product.brand == brand;
      final matchPrice = maxPrice == null || product.price <= maxPrice;
      return matchCategory && matchBrand && matchPrice;
    }).toList();

    if (sortBy == 'price') {
      filtered.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortBy == 'rating') {
      filtered.sort((a, b) => b.rating.compareTo(a.rating));
    }

    return filtered;
  }

  /// 🛍️ Get Products by Category
  Future<List<ProductsApiModel>> getProductsByCategory(String category) async {
    try {
      return await ApiService.getProductsByCategory(category);
    } catch (e) {
      return [];
    }
  }

  /// 📦 Get Available Categories
  Future<List<String>> getCategories() async {
    try {
      return await ApiService.getCategories();
    } catch (e) {
      return [];
    }
  }

  /// 🤖 Get Random Products
  Future<List<ProductsApiModel>> getRandomProducts({int count = 15}) async {
    try {
      final all = await getAllProducts();
      if (all.isEmpty) return [];

      final random = Random();
      final selectedIndexes = <int>{};
      while (selectedIndexes.length < count && selectedIndexes.length < all.length) {
        selectedIndexes.add(random.nextInt(all.length));
      }

      return selectedIndexes.map((i) => all[i]).toList();
    } catch (e) {
      return [];
    }
  }

  /// 🔗 Get Related Products
  Future<List<ProductsApiModel>> getRelatedProducts({
    required ProductsApiModel selectedProduct,
    required List<ProductsApiModel> allProducts,
  }) async {
    final selectedTags = selectedProduct.tags.toSet();
    final related = allProducts.where((product) {
      if (product.title == selectedProduct.title) return false;
      final overlap = product.tags.toSet().intersection(selectedTags);
      return overlap.isNotEmpty;
    }).toList();

    return related;
  }
}
