import 'package:flutter/material.dart';
import 'package:hiring_task_fawad/constants/custom_appbar.dart';
import 'package:provider/provider.dart';
import '../constants/text_styles.dart';
import '../model/products_model.dart';
import '../viewmodel/viewmodel.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favorites'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                onChanged: (query) => context.read<ProductViewModel>().searchFavorites(query),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: "Search favorites",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Total Results Found
            Consumer<ProductViewModel>(
              builder: (context, viewModel, child) {
                return Text(
                  "${viewModel.totalFavorites} results found",
                  style: MyTextStyle.f11W400(context, color: Colors.black.withOpacity(0.4)),
                );
              },
            ),
            const SizedBox(height: 10),

            // Favorite Products List
            Expanded(
              child: Selector<ProductViewModel, List<ProductModel>>(
                selector: (_, viewModel) => viewModel.favoriteProducts,
                builder: (context, favoriteProducts, child) {
                  if (favoriteProducts.isEmpty) {
                    return const Center(child: Text("No favorite products yet."));
                  }

                  return ListView.builder(
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      final product = favoriteProducts[index];
                      return ListTile(
                        leading: Image.network(
                          product.thumbnail ?? "https://via.placeholder.com/150",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product.title,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("\$${product.price}"),
                        trailing: IconButton(
                          icon: Icon(
                            context.read<ProductViewModel>().favoriteProductIds.contains(product.id) ? Icons.favorite : Icons.favorite_border,
                            color: context.read<ProductViewModel>().favoriteProductIds.contains(product.id) ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            context.read<ProductViewModel>().toggleFavorite(product.id);
                          },
                        ),
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
