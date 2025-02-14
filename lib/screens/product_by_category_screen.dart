import 'package:flutter/material.dart';
import 'package:hiring_task_fawad/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../constants/custom_appbar.dart';
import '../constants/custom_product_widget.dart';
import '../constants/text_styles.dart';
import 'package:get/get.dart';
import '../viewmodel/viewmodel.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final String? slug;
  const ProductByCategoryScreen({super.key, this.slug});

  @override
  State<ProductByCategoryScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductByCategoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProductViewModel>().fetchProductsByCategory(widget.slug ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Products', showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: "Search products",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Total Results Found (Dynamically Updated)
            Consumer<ProductViewModel>(
              builder: (context, viewModel, child) {
                return Text(
                  "${viewModel.totalCategoryProducts} results found",
                  style: MyTextStyle.f11W400(context, color: Colors.black.withValues(alpha: 0.4)),
                );
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Consumer<ProductViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoadingCategoryProducts) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (viewModel.categoryProducts.isEmpty) {
                    return const Center(child: Text("No products available"));
                  }

                  return ListView.builder(
                    itemCount: viewModel.categoryProducts.length,
                    itemBuilder: (context, index) {
                      final product = viewModel.categoryProducts[index];
                      return ProductCard(
                        onTap: () {
                          Get.to(ProductDetailsScreen(productId: product.id));
                        },
                        imagePath: product.thumbnail,
                        title: product.title,
                        price: "\$${product.price}",
                        rating: product.rating,
                        category: product.category,
                        brand: product.brand,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
