import 'package:flutter/material.dart';
import 'package:food_api_architecture/controller/custom_search_bar.dart';
import 'package:food_api_architecture/getx/search_controller.dart';
import 'package:get/get.dart';
import '../controller/custom_choiceChip.dart';
import '../getx/choice_chip.dart';
import '../controller/custom_loader.dart'; // <- import your CustomLoader

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ChoiceChipController controller = Get.put(ChoiceChipController());
  final TextEditingController textController = TextEditingController();
  final SearchProductController searchProductController = Get.put(SearchProductController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Products"),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomSearchBar(
              controller: textController,
              onChanged: (query) => searchProductController.searchNewProducts(query.trim()),
            ),
          ),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 25),
          child: InkWell(
            onTap: () {
              Get.toNamed('filterScreen');
            },
              child: Text('Filter',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),)
        ],
      ),
      body: Column(
        children: [
          // Category Chips
          Obx(() {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Row(
                children: controller.categories.map((category) {
                  return CustomChoiceChip(
                    label: category,
                    selected: controller.selectedCategory.value == category,
                    onSelected: () {

                      searchProductController.products.clear();

                      controller.selectCategory(category);
                    },
                  );
                }).toList(),
              ),
            );
          }),
          // Products Grid or Loader
          Expanded(
            child: Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              }

              if (controller.isLoading.value) {
                // Shimmer Loader GridView
                return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.73,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomLoader(
                                height: double.infinity,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomLoader(width: 80, height: 16),
                            const SizedBox(height: 6),
                            CustomLoader(width: 40, height: 14),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }


              final productsToShow = searchProductController.products.isNotEmpty
                  ? searchProductController.products
                  : controller.products;

              if (productsToShow.isEmpty) {
                return const Center(child: Text("No products found"));
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: productsToShow.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.73,
                ),
                itemBuilder: (context, index) {
                  final product = productsToShow[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detailsScreen', arguments: product);
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  product.thumbnail,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(child: CircularProgressIndicator());
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text("₹${product.price}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
