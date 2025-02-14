import 'package:dio/dio.dart';
import 'package:hiring_task_fawad/model/product_detail_model.dart';
import 'package:hiring_task_fawad/model/products_by_category_model.dart';
import '../core/api_client.dart';
import '../model/categories_model.dart';
import '../model/products_model.dart';

class ProductRepository {
  final ApiClient _apiClient = ApiClient(baseUrl: "https://dummyjson.com");

  Future<Map<String, dynamic>?> fetchProducts() async {
    Response? response = await _apiClient.get("/products");

    if (response != null && response.statusCode == 200) {
      List<dynamic> productsJson = response.data["products"] ?? [];
      int totalResults = response.data["total"] ?? 0; // Handle null total

      List<ProductModel> products = productsJson.map((json) => ProductModel.fromJson(json)).toList();

      return {
        "products": products,
        "total": totalResults,
      };
    }
    return null;
  }

  // Fetch Categories
  Future<List<CategoryModel>?> fetchCategories() async {
    Response? response = await _apiClient.get("/products/categories");

    if (response != null && response.statusCode == 200) {
      List<dynamic> categoriesJson = response.data;

      return categoriesJson.map((json) => CategoryModel.fromJson(json)).toList();
    }
    return null;
  }

  // Fetch Products by Category
  Future<Map<String, dynamic>?> fetchProductsByCategory(String categorySlug) async {
    Response? response = await _apiClient.get("/products/category/$categorySlug");
    if (response != null && response.statusCode == 200) {
      List<dynamic> productsJson = response.data["products"] ?? [];
      int totalResults = response.data["total"] ?? 0;
      List<ProductByCategoryModel> products = productsJson.map((json) => ProductByCategoryModel.fromJson(json)).toList();
      return {"products": products, "total": totalResults};
    }
    return null;
  }

  // Fetch Product by ID
  Future<ProductDetailModel?> fetchProductById(int productId) async {
    Response? response = await _apiClient.get("/products/$productId");

    if (response != null && response.statusCode == 200) {
      return ProductDetailModel.fromJson(response.data);
    }
    return null;
  }
}
