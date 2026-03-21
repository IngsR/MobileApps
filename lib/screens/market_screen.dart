import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final List<Map<String, dynamic>> _products = [
    {'name': 'Sepatu Sport Pro', 'price': 'Rp 450.000', 'emoji': '👟', 'rating': 4.8, 'sold': 120},
    {'name': 'Tas Kerja Elegan', 'price': 'Rp 320.000', 'emoji': '👜', 'rating': 4.6, 'sold': 85},
    {'name': 'Kemeja Kasual', 'price': 'Rp 175.000', 'emoji': '👔', 'rating': 4.5, 'sold': 210},
    {'name': 'Jam Tangan Klasik', 'price': 'Rp 650.000', 'emoji': '⌚', 'rating': 4.9, 'sold': 67},
    {'name': 'Kacamata Stylish', 'price': 'Rp 280.000', 'emoji': '🕶️', 'rating': 4.3, 'sold': 95},
    {'name': 'Topi Baseball', 'price': 'Rp 95.000', 'emoji': '🧢', 'rating': 4.4, 'sold': 150},
    {'name': 'Celana Jeans', 'price': 'Rp 230.000', 'emoji': '👖', 'rating': 4.7, 'sold': 180},
    {'name': 'Sneakers Casual', 'price': 'Rp 380.000', 'emoji': '👠', 'rating': 4.5, 'sold': 72},
  ];

  int _selectedCategory = 0;
  final List<String> _categories = ['Semua', 'Pakaian', 'Sepatu', 'Aksesoris'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pasar', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    '${_products.length} produk tersedia',
                    style: const TextStyle(
                      color: AppTheme.textGrey,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(10),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search_rounded, color: AppTheme.textGrey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cari produk...',
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: AppTheme.textGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category Chips
                  SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        final selected = _selectedCategory == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedCategory = index),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: selected ? AppTheme.primary : AppTheme.surface,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: selected
                                  ? [BoxShadow(color: AppTheme.primary.withAlpha(60), blurRadius: 8)]
                                  : [],
                            ),
                            child: Text(
                              _categories[index],
                              style: TextStyle(
                                color: selected ? Colors.white : AppTheme.textGrey,
                                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Grid Produk
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.78,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final p = _products[index];
                  return _buildProductCard(p);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> p) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Area
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.primary.withAlpha(15),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Text(p['emoji'] as String, style: const TextStyle(fontSize: 52)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p['name'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppTheme.textDark,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                    const SizedBox(width: 2),
                    Text(
                      '${p['rating']}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppTheme.textGrey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${p['sold']} terjual',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppTheme.textGrey,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  p['price'] as String,
                  style: const TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
