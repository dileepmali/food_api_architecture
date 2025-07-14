import 'package:flutter/material.dart';
import '../model/products_api_model.dart';

class ProductHeader extends StatelessWidget {
  final ProductsApiModel product;

  const ProductHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            product.thumbnail,
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          product.title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          "₹${product.price}",
          style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(product.description, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
