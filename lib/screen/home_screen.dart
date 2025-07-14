import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/custom_loader.dart';
<<<<<<< HEAD
=======
import '../error_handling/app_error_widget.dart';
>>>>>>> 3906723 (Initial commit with full project)
import '../getx/products_random.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
<<<<<<< HEAD
  final ProductRandomController productController = Get.put(ProductRandomController());
=======
  final productController = Get.find<ProductRandomController>();
>>>>>>> 3906723 (Initial commit with full project)

  @override
  void initState() {
    super.initState();
    productController.fetchRandomProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(title: Text("Home Screen"),
      actions: [
        Padding(padding: EdgeInsets.only(right: 25),
        child: InkWell(
          onTap: () {
            Get.toNamed('allProducts');
          },
            child: Text('All',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold,fontSize: 18),)),)
      ],),
=======
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: InkWell(
              onTap: () {
                Get.toNamed('allProducts');
              },
              child: const Text(
                'All',
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
>>>>>>> 3906723 (Initial commit with full project)
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
<<<<<<< HEAD
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
=======
            itemBuilder: (_, __) => Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomLoader(width: double.infinity, height: 150, borderRadius: BorderRadius.all(Radius.circular(8)), isLoading: true),
                    SizedBox(height: 10),
                    CustomLoader(width: 120, height: 20, borderRadius: BorderRadius.all(Radius.circular(4)), isLoading: true),
                    SizedBox(height: 6),
                    CustomLoader(width: 80, height: 16, borderRadius: BorderRadius.all(Radius.circular(4)), isLoading: true),
                  ],
                ),
              ),
            ),
          );
        }

        // ✅ Use AppErrorWidget if errorMessage is present
        if (productController.errorMessage.value.isNotEmpty) {
          return AppErrorWidget(
            message: productController.errorMessage.value,
            onRetry: () => productController.fetchRandomProduct(),
          );
>>>>>>> 3906723 (Initial commit with full project)
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
<<<<<<< HEAD
                        return CustomLoader(
                          width: double.infinity,
                          height: 150,
                          borderRadius: BorderRadius.circular(8),
                          isLoading: true,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
=======
                        return const CustomLoader(
                          width: double.infinity,
                          height: 150,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          isLoading: true,
                        );
                      },
                      errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported, size: 100),
>>>>>>> 3906723 (Initial commit with full project)
                    )
                        : const Icon(Icons.image_not_supported, size: 100),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
<<<<<<< HEAD
                          // Title
=======
>>>>>>> 3906723 (Initial commit with full project)
                          SizedBox(
                            height: 25,
                            child: CustomLoader(
                              isLoading: false,
                              width: double.infinity,
                              height: 20,
                              borderRadius: BorderRadius.circular(4),
                              child: Text(
                                product.title,
<<<<<<< HEAD
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
=======
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
>>>>>>> 3906723 (Initial commit with full project)
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
<<<<<<< HEAD

                          // Price
=======
>>>>>>> 3906723 (Initial commit with full project)
                          CustomLoader(
                            isLoading: false,
                            width: double.infinity,
                            height: 16,
                            borderRadius: BorderRadius.circular(4),
                            child: Text(
                              '\$${product.price.toStringAsFixed(2)}',
<<<<<<< HEAD
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                          ),

=======
                              style: const TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ),
>>>>>>> 3906723 (Initial commit with full project)
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
