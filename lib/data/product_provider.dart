import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/mock_data.dart';

// Simple ChangeNotifer to simulate a data provider
class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  ProductProvider() {
    _loadProducts();
  }

  void _loadProducts() {
    _products = MockData.getProducts();
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index].isFavorite = !_products[index].isFavorite;
      notifyListeners();
    }
  }

  Product getById(String id) {
    return _products.firstWhere((p) => p.id == id);
  }
}
