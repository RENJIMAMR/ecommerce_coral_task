import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_application/model/home_screen/product_model.dart';

class HomescreenController extends GetxController {
  List<ProductsModel> productList = [];
  bool isProductLoading = true;
  List<String> categoriesList = ["All"];
  int selectedCategoryIndex = 0;
  bool isCategoriesLoading = true;

  // Fetch categories from the API
  Future<void> getCategories() async {
    try {
      final url = Uri.parse('https://fakestoreapi.com/products/categories');
      final response = await http.get(url);
      print("Categories response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        categoriesList.addAll(List<String>.from(jsonDecode(response.body)));
        print("Fetched categories: $categoriesList");
      } else {
        print("Failed to fetch categories");
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
    isCategoriesLoading = false;
    update(); 
  }

  // Fetch products based on selected category
  Future<void> getAllProducts({String category = ''}) async {
    isProductLoading = true;
    update();

    try {
      final allUrl = Uri.parse('https://fakestoreapi.com/products');
      final categoryUrl =
          Uri.parse('https://fakestoreapi.com/products/category/$category');
      final url = category.isEmpty ? allUrl : categoryUrl;
      final response = await http.get(url);
      print("Products response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        productList = productsModelFromJson(response.body);
        print("Fetched products: $productList");
      } else {
        print("Failed to fetch products");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
    isProductLoading = false;
    update(); 
  }

  // Set selected category and fetch products
  void getCategoryIndex(int index) {
    selectedCategoryIndex = index;
    String selectedCategory = categoriesList[index];
    getAllProducts(category: selectedCategory == "All" ? "" : selectedCategory);
    update(); 
  }
}
