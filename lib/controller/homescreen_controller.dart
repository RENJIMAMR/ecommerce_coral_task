import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_application/model/listing_screen/product_model.dart';

class HomescreenController with ChangeNotifier {
  List<ProductsModel> productList = [];
  bool isProductLoading = false;
  List categoriesList = ["All"];
  int selectedCategoryIndex = 0;
  bool isCategoriesLoading = false;
  Future<void> getCategories() async {
    isCategoriesLoading = true;
    notifyListeners();
    try {
      final url = Uri.parse('https://fakestoreapi.com/products/categories');
      var response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        categoriesList.addAll(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }

    isCategoriesLoading = false;
    notifyListeners();
  }

  getCategoryindex(int index) {
    selectedCategoryIndex = index;
    if (selectedCategoryIndex == 0) {
      getAllProducts();
    } else {
      getAllProducts(category: categoriesList[selectedCategoryIndex]);
    }
    notifyListeners();
  }

  Future<void> getAllProducts({String category = ''}) async {
    isProductLoading = true;
    notifyListeners();
    try {
      final allUrl = Uri.parse('https://fakestoreapi.com/products');
      final categoryUrl =
          Uri.parse('https://fakestoreapi.com/products/category/$category');
      final url = category.isEmpty ? allUrl : categoryUrl;
      var allProduct = await http.get(url);
      if (allProduct.statusCode == 200) {
        productList = productsModelFromJson(allProduct.body);
      }
    } catch (e) {
      print(e);
    }
    isProductLoading = false;
    notifyListeners();
  }
}
