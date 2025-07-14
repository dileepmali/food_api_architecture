import 'package:flutter/material.dart';

class ProductImageGallery extends StatelessWidget {
  final List<String> images;

  const ProductImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              images[index],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
