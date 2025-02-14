import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hiring_task_fawad/screens/product_by_category_screen.dart';
import 'package:provider/provider.dart';
import '../constants/custom_appbar.dart';
import '../viewmodel/viewmodel.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProductViewModel>().fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Categories', showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                onChanged: (query) => context.read<ProductViewModel>().searchCategories(query),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: "Search categories",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Total Results Found (Dynamic)
            Consumer<ProductViewModel>(
              builder: (context, viewModel, child) {
                return Text(
                  "${viewModel.categories.length} results found", // Dynamically updated count
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                );
              },
            ),

            const SizedBox(height: 10),

            // Categories Grid
            Expanded(
              child: Consumer<ProductViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoadingCategories) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (viewModel.categories.isEmpty) {
                    return const Center(child: Text("No categories available"));
                  }

                  return GridView.builder(
                    itemCount: viewModel.categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final category = viewModel.categories[index];
                      return CategoryCard(
                        onTap: () async {
                          Get.to(ProductByCategoryScreen(slug: category.slug));
                        },
                        imagePath: category.url,
                        label: category.name,
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

// Category Card Widget
class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap;

  const CategoryCard({super.key, required this.imagePath, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Image.network(imagePath, width: double.infinity, height: double.infinity, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black.withValues(alpha: 0.6), Colors.black.withValues(alpha: 0.1)],
                ),
              ),
            ),

            // Category Label
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
