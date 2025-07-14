import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/custom_loader.dart';
import '../getx/products_random.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final ProductRandomController productController = Get.put(ProductRandomController());

  @override
  void initState() {
    super.initState();
    productController.fetchRandomProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),
      actions: [
        Padding(padding: EdgeInsets.only(right: 25),
        child: InkWell(
          onTap: () {
            Get.toNamed('allProducts');
          },
            child: Text('All',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 18),)),)
      ],),
      body: Obx(() {
        if (productController.isLoading.value) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.70,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLoader(
                        width: double.infinity,
                        height: 150,
                        borderRadius: BorderRadius.circular(8),
                        isLoading: true,
                      ),
                      const SizedBox(height: 10),
                      CustomLoader(
                        width: 120,
                        height: 20,
                        borderRadius: BorderRadius.circular(4),
                        isLoading: true,
                      ),
                      const SizedBox(height: 6),
                      CustomLoader(
                        width: 80,
                        height: 16,
                        borderRadius: BorderRadius.circular(4),
                        isLoading: true,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        if (productController.errorMessage.value.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.70,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            final imageUrl = product.images.isNotEmpty ? product.images[0] : '';

            return GestureDetector(
              onTap: () {
                Get.toNamed('/detailsScreen', arguments: product);
              },
              child: Card(
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageUrl.isNotEmpty
                        ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CustomLoader(
                          width: double.infinity,
                          height: 150,
                          borderRadius: BorderRadius.circular(8),
                          isLoading: true,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
                    )
                        : const Icon(Icons.image_not_supported, size: 100),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          SizedBox(
                            height: 25,
                            child: CustomLoader(
                              isLoading: false,
                              width: double.infinity,
                              height: 20,
                              borderRadius: BorderRadius.circular(4),
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),

                          // Price
                          CustomLoader(
                            isLoading: false,
                            width: double.infinity,
                            height: 16,
                            borderRadius: BorderRadius.circular(4),
                            child: Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
