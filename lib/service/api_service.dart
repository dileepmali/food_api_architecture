import 'dart:math';

import 'package:dio/dio.dart';
import '../model/products_api_model.dart';

class ApiService {

  static const String baseUrl = 'https://dummyjson.com';
  static final Dio _dio = Dio();


  static Future<List<ProductsApiModel>> getAllProducts() async {
    final response = await _dio.get('$baseUrl/products');
    final List<dynamic> data = response.data['products'];
    return data.map((e) => ProductsApiModel.fromJson(e)).toList();
  }




  static Future<List<ProductsApiModel>> searchProducts(String query) async {
    final response = await _dio.get(
      '$baseUrl/products/search',
      queryParameters: {'q': query},
    );
    final List<dynamic> data = response.data['products'];
    return data.map((e) => ProductsApiModel.fromJson(e)).toList();
  }

  static Future<List<String>> getCategories() async {
    final response = await _dio.get('$baseUrl/products/categories');
    return List<String>.from(response.data);
  }

  static Future<List<ProductsApiModel>> getProductsByCategory(String category) async {
    final response = await _dio.get('$baseUrl/products/category/$category');
    final List data = response.data['products'];
    return data.map((e) => ProductsApiModel.fromJson(e)).toList();
  }





  static Future<List<ProductsApiModel>> getRandomProducts() async {
    final response = await _dio.get('$baseUrl/products');
    final List<dynamic> data = response.data['products'];

    if (data.isEmpty) return [];

    final random = Random();
    final Set<int> selectedIndexes = {};

    while (selectedIndexes.length < 15 && selectedIndexes.length < data.length) {
      selectedIndexes.add(random.nextInt(data.length));
    }

    final List<ProductsApiModel> randomProducts = selectedIndexes
        .map((index) => ProductsApiModel.fromJson(data[index]))
        .toList();

    return randomProducts;
  }

}
