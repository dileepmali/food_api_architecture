import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/custom_button.dart';
import '../controller/date_formate.dart';
import '../getx/choice_chip.dart'; // For getting all products
<<<<<<< HEAD
import '../helper_class/bar_code.dart';
import '../helper_class/details_row.dart';
import '../helper_class/icons_row.dart';
import '../helper_class/qr_code.dart';
import '../helper_class/section_card.dart';
=======
>>>>>>> 3906723 (Initial commit with full project)
import '../model/products_api_model.dart';
import '../controller/custom_loader.dart';

import '../getx/related_products_controller.dart';
<<<<<<< HEAD
=======
import '../utils/bar_code.dart';
import '../utils/details_row.dart';
import '../utils/icons_row.dart';
import '../utils/qr_code.dart';
import '../utils/section_card.dart';
>>>>>>> 3906723 (Initial commit with full project)

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLoading = true;
  late ProductsApiModel product;

<<<<<<< HEAD
  final RelatedProductsController relatedController = Get.put(RelatedProductsController());
=======
  final  relatedController = Get.find<RelatedProductsController>();
>>>>>>> 3906723 (Initial commit with full project)

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      product = Get.arguments;

      final allProducts = Get.put(ChoiceChipController()).products;

      relatedController.fetchRelatedProducts(
        selectedProduct: product,
        allProducts: allProducts,
      );

      setState(() {
        isLoading = false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(isLoading ? 'Loading...' : product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: isLoading ? _buildLoadingUI() : _buildProductDetailsUI(),
      ),
    );
  }

  Widget _buildLoadingUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLoader(width: double.infinity, height: 240, borderRadius: BorderRadius.circular(16)),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return CustomLoader(width: 100, height: 100, borderRadius: BorderRadius.circular(12));
            },
          ),
        ),
        const SizedBox(height: 20),
        CustomLoader(width: double.infinity, height: 30),
        const SizedBox(height: 6),
        CustomLoader(width: 100, height: 22),
        const SizedBox(height: 8),
        CustomLoader(width: double.infinity, height: 16),
        const SizedBox(height: 32),
        CustomLoader(width: 100.w, height: 180),
        const SizedBox(height: 8),
        CustomLoader(width: 100.w, height: 100),
        const SizedBox(height: 8),
        CustomLoader(width: 100.w, height: 130),
        const SizedBox(height: 8),
        CustomLoader(width: 100.w, height: 150),
        const SizedBox(height: 8),
        CustomLoader(width: 100.w, height: 120),
        const SizedBox(height: 8),
        CustomLoader(width: double.infinity, height: 100),
        const SizedBox(height: 16),
        CustomLoader(width: double.infinity, height: 100),
        const SizedBox(height: 16),
        CustomLoader(),
        Column(children: List.generate(2, (_) => CustomLoader())),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomLoader(width: 45.w, height: 48),
            CustomLoader(width: 45.w, height: 48),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildProductDetailsUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            product.thumbnail,
            height: 240,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: product.images.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return Card(

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.images[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(product.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text("₹${product.price}", style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(product.description, style: const TextStyle(fontSize: 16)),
        const Divider(height: 32),

        SectionCard(title: "Product Info", children: [
          DetailRow(title: "Brand", value: product.brand),
          DetailRow(title: "Category", value: product.category),
          DetailRow(title: "SKU", value: product.sku),
          DetailRow(title: "Stock", value: "${product.stock.toInt()} items"),
        ]),

        SectionCard(title: "Rating & Offer", children: [
          IconRow(icon: Icons.star, label: "Rating", value: "${product.rating.toStringAsFixed(1)} "),
          IconRow(icon: Icons.discount, label: "Discount", value: "${product.discountPercentage}%"),
        ]),

        SectionCard(title: "Dimensions & Weight", children: [
          DetailRow(title: "Dimensions", value: "${product.dimensions.width} x ${product.dimensions.height} x ${product.dimensions.depth} cm"),
          DetailRow(title: "Weight", value: "${product.weight}g"),
        ]),

        SectionCard(title: "Other Info", children: [
          IconRow(icon: Icons.verified_user, label: "Warranty", value: product.warrantyInformation),
          IconRow(icon: Icons.local_shipping, label: "Shipping", value: product.shippingInformation),
          IconRow(icon: Icons.assignment_return, label: "Return Policy", value: product.returnPolicy),
          IconRow(icon: Icons.check_circle, label: "Availability", value: product.availabilityStatus),
        ]),

        SectionCard(title: "Meta Info", children: [
          DetailRow(title: "Created At", value: DateFormatter.formatDate(product.meta.createdAt)),
          DetailRow(title: "Updated At", value: DateFormatter.formatDate(product.meta.updatedAt)),
        ]),

        SectionCard(title: "Barcode", children: [
          BarcodeBox(data: product.meta.barcode),
        ]),

        SectionCard(title: "QR Code", children: [
          PrettyQRCodeBox(data: product.meta.qrCode),
        ]),

        SectionCard(title: "Minimum & Tags", children: [
          DetailRow(title: "Min Order Qty", value: "${product.minimumOrderQuantity}"),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: product.tags.map((tag) => Chip(label: Text(tag))).toList(),
          ),
        ]),

        if (product.reviews.isNotEmpty)
          SectionCard(
            title: "Customer Reviews",
            children: product.reviews.map((review) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(review.reviewerName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.comment),
                    Text("${review.rating} "),
                  ],
                ),
              );
            }).toList(),
          ),

        // —— Related Products Section ——
        Obx(() {
          if (relatedController.relatedProducts.isEmpty) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Related Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: relatedController.relatedProducts.length,
                  itemBuilder: (context, index) {
                    final item = relatedController.relatedProducts[index];
                    return GestureDetector(
                      onTap: () {
                        // Get.toNamed('/detailsScreen', arguments: item);
                         Get.offNamed('/detailsScreen', arguments: item);
                      },
                      child: Container(
                        width: 140,
                        margin: const EdgeInsets.only(right: 10),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: Image.network(
                                  item.thumbnail,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "₹${item.price}",
                                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              label: 'Add Cart',
              icon: Icons.shopping_cart,
              isFilled: true,
              width: 45.w,
              onPressed: () {},
            ),
            CustomButton(
              label: 'Buy Now',
              icon: Icons.payment,
              isFilled: false,
              width: 45.w,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
