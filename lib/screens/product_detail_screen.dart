import 'package:flutter/material.dart';
import 'package:hiring_task_fawad/constants/text_styles.dart';
import 'package:provider/provider.dart';
import '../model/product_detail_model.dart';
import '../viewmodel/viewmodel.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductViewModel>().fetchProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoadingProductDetails) {
            return const Center(child: CircularProgressIndicator());
          }

          ProductDetailModel? product = viewModel.selectedProduct;
          if (product == null) {
            return const Center(child: Text("Product not found."));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Image.network(
                  product.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),

                // Product Details Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Wishlist Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Consumer<ProductViewModel>(
                            builder: (context, viewModel, child) {
                              bool isFavorite = viewModel.favoriteProductIds.contains(product.id);
                              return IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  size: 24,
                                  color: isFavorite ? Colors.red : Colors.black,
                                ),
                                onPressed: () {
                                  viewModel.toggleFavorite(product.id);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Product Details
                      ProductDetailRow(label: "Name", value: product.title),
                      ProductDetailRow(label: "Price", value: "\$${product.price}"),
                      ProductDetailRow(label: "Category", value: product.category),
                      ProductDetailRow(label: "Brand", value: product.brand),

                      // Rating
                      Row(
                        children: [
                          Text(
                            "Rating :",
                            style: MyTextStyle.f12W400(context, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 5),
                          Text(product.rating.toString(), style: const TextStyle(fontSize: 16)),
                          const SizedBox(width: 5),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                size: 16,
                                color: index < product.rating.floor() ? Colors.amber : Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      ProductDetailRow(label: "Stock", value: product.stock.toString()),
                      const SizedBox(height: 10),
                      Text("Description :", style: MyTextStyle.f12W400(context, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 5),
                      Text(product.description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 15),
                      Text("Product Gallery :", style: MyTextStyle.f12W400(context, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: product.images.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 images per row
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.images[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                "assets/default.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Product Detail Row Widget
class ProductDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const ProductDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text("$label :", style: MyTextStyle.f12W400(context, fontWeight: FontWeight.w600)),
          const SizedBox(width: 5),
          Text(value, style: MyTextStyle.f11W400(context)),
        ],
      ),
    );
  }
}
