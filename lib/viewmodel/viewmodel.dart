import 'dart:async';
import 'package:flutter/material.dart';
import '../model/categories_model.dart';
import '../model/products_by_category_model.dart';
import '../model/products_model.dart';
import '../model/product_detail_model.dart';
import '../repository/repo.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  // Products
  List<ProductModel> _products = [];
  List<ProductModel> _filteredProducts = [];
  bool _isLoadingProducts = false;
  int _totalProducts = 0;
  String _searchQueryProducts = "";

  // Categories
  List<CategoryModel> _categories = [];
  List<CategoryModel> _filteredCategories = [];
  bool _isLoadingCategories = false;
  String _searchQueryCategories = "";

  // Favorites
  Set<int> _favoriteProducts = {};
  List<ProductModel> _filteredFavorites = [];
  String _searchQueryFavorites = "";

  // Product Details
  ProductDetailModel? _selectedProduct;
  bool _isLoadingProductDetails = false;

  // Category Products
  List<ProductByCategoryModel> _categoryProducts = [];
  bool _isLoadingCategoryProducts = false;
  int _totalCategoryProducts = 0;

  Timer? _debounceTimer;

  // Getters
  bool get isLoadingProducts => _isLoadingProducts;
  bool get isLoadingCategories => _isLoadingCategories;
  bool get isLoadingProductDetails => _isLoadingProductDetails;
  bool get isLoadingCategoryProducts => _isLoadingCategoryProducts;

  int get totalProducts => _searchQueryProducts.isNotEmpty ? _filteredProducts.length : _products.length;
  int get totalCategories => _searchQueryCategories.isNotEmpty ? _filteredCategories.length : _categories.length;
  int get totalFavorites => _searchQueryFavorites.isNotEmpty ? _filteredFavorites.length : favoriteProductList.length;
  int get totalCategoryProducts => _totalCategoryProducts;

  List<ProductModel> get products => _searchQueryProducts.isNotEmpty ? _filteredProducts : _products;
  List<CategoryModel> get categories => _searchQueryCategories.isNotEmpty ? _filteredCategories : _categories;
  List<ProductByCategoryModel> get categoryProducts => _categoryProducts;
  ProductDetailModel? get selectedProduct => _selectedProduct;
  Set<int> get favoriteProductIds => _favoriteProducts;

  // Corrected getter for favorite products
  List<ProductModel> get favoriteProductList {
    return _products.where((product) => _favoriteProducts.contains(product.id)).toList();
  }

  List<ProductModel> get favoriteProducts {
    return _searchQueryFavorites.isNotEmpty ? _filteredFavorites : favoriteProductList;
  }

  // Fetch Products
  Future<void> fetchProducts() async {
    _isLoadingProducts = true;
    notifyListeners();

    try {
      var response = await _repository.fetchProducts();
      if (response != null) {
        _products = response["products"] as List<ProductModel>;
        _filteredProducts = _products;
        _totalProducts = response["total"] as int;
      }
    } catch (e) {
      debugPrint("Error fetching products: $e");
    } finally {
      _isLoadingProducts = false;
      notifyListeners();
    }
  }

  // Fetch Categories
  Future<void> fetchCategories() async {
    _isLoadingCategories = true;
    notifyListeners();

    try {
      List<CategoryModel>? fetchedCategories = await _repository.fetchCategories();
      if (fetchedCategories != null) {
        _categories = fetchedCategories;
        _filteredCategories = _categories;
      }
    } catch (e) {
      debugPrint("Error fetching categories: $e");
    } finally {
      _isLoadingCategories = false;
      notifyListeners();
    }
  }

  // Fetch Products by Category
  Future<void> fetchProductsByCategory(String categorySlug) async {
    _categoryProducts = [];
    _isLoadingCategoryProducts = true;
    notifyListeners();

    try {
      var response = await _repository.fetchProductsByCategory(categorySlug);
      if (response != null) {
        _categoryProducts = response["products"] as List<ProductByCategoryModel>;
        _totalCategoryProducts = response["total"] as int;
      }
    } catch (e) {
      debugPrint("Error fetching products for category: $e");
    } finally {
      _isLoadingCategoryProducts = false;
      notifyListeners();
    }
  }

  // Fetch Product Details by ID
  Future<void> fetchProductDetails(int productId) async {
    _isLoadingProductDetails = true;
    notifyListeners();

    try {
      ProductDetailModel? product = await _repository.fetchProductById(productId);
      if (product != null) {
        _selectedProduct = product;
      }
    } catch (e) {
      debugPrint("Error fetching product details: $e");
    } finally {
      _isLoadingProductDetails = false;
      notifyListeners();
    }
  }

  // Search Products
  void searchProducts(String query) {
    _searchQueryProducts = query;
    _debounceSearch(() {
      _filteredProducts = query.isEmpty ? _products : _products.where((product) => product.title.toLowerCase().contains(query.toLowerCase())).toList();
      notifyListeners();
    });
  }

  // Search Categories
  void searchCategories(String query) {
    _searchQueryCategories = query;
    _debounceSearch(() {
      _filteredCategories = query.isEmpty ? _categories : _categories.where((category) => category.name.toLowerCase().contains(query.toLowerCase())).toList();
      notifyListeners();
    });
  }

  // Search Favorites
  void searchFavorites(String query) {
    _searchQueryFavorites = query;
    _debounceSearch(() {
      _filteredFavorites = query.isEmpty ? favoriteProductList : favoriteProductList.where((product) => product.title.toLowerCase().contains(query.toLowerCase())).toList();
      notifyListeners();
    });
  }

  // Debounce search function
  void _debounceSearch(VoidCallback callback) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), callback);
  }

  // Toggle Favorite
  void toggleFavorite(int productId) {
    if (_favoriteProducts.contains(productId)) {
      _favoriteProducts.remove(productId);
    } else {
      _favoriteProducts.add(productId);
    }
    notifyListeners();
  }
}
