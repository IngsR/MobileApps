import 'dart:async';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];
  bool _isLoading = false;
  String _error = '';
  
  String _searchQuery = '';
  Timer? _debounce;
  
  // Category variables
  final List<String> _categories = ['Semua', 'Pakaian', 'Sepatu', 'Aksesoris'];
  int _selectedCategoryIndex = 0;

  List<Product> get items {
    List<Product> filtered = _items;

    if (_searchQuery.isNotEmpty) {
      final queryWords = _searchQuery.toLowerCase().split(RegExp(r'\s+'));
      filtered = filtered.where((p) {
        final searchString = '${p.title} ${p.description}'.toLowerCase();
        return queryWords.every((word) => searchString.contains(word));
      }).toList();
    }

    if (_selectedCategoryIndex > 0) {
      final categoryFilter = _categories[_selectedCategoryIndex];
      if (categoryFilter == 'Pakaian') {
        filtered = filtered.where((p) => p.category.contains('clothing')).toList();
      } else if (categoryFilter == 'Aksesoris') {
        filtered = filtered.where((p) => p.category == 'jewelery').toList();
      } else if (categoryFilter == 'Sepatu') {
        // FakeStore largely misses shoes, so we'll just show electronics or specific filtered ones
        filtered = filtered.where((p) => p.category == 'electronics').toList(); 
      }
    }
    
    return filtered;
  }
  
  List<Product> get featuredProducts {
    // Return first 3 items with high rating or just first 3
    if (_items.isEmpty) return [];
    final sorted = List<Product>.from(_items)..sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(3).toList();
  }

  bool get isLoading => _isLoading;
  String get error => _error;
  List<String> get categories => _categories;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  String get searchQuery => _searchQuery;

  ProductProvider() {
    fetchProducts();
  }

  void search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _searchQuery = query.trim();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void setCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final apiService = ApiService();
      _items = await apiService.fetchProducts();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
