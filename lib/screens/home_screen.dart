import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'Selamat Pagi';
    if (hour < 15) return 'Selamat Siang';
    if (hour < 18) return 'Selamat Sore';
    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Greeting
              _buildHeader(context),
              const SizedBox(height: 24),

              // Stats Cards
              _buildStatsRow(context),
              const SizedBox(height: 28),

              // Section: Produk Unggulan
              Text(
                'Produk Unggulan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              _buildFeaturedProducts(context),
              const SizedBox(height: 28),

              // Section: Aktivitas Terbaru
              Text(
                'Aktivitas Terbaru',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _buildActivityList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primary, AppTheme.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withAlpha(80),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_getGreeting()} 👋',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Budi Santoso',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '✨ Member Premium',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withAlpha(50),
            child: const Text(
              'BS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final stats = [
      {'icon': Icons.inventory_2_rounded, 'value': '24', 'label': 'Produk'},
      {'icon': Icons.shopping_cart_rounded, 'value': '8', 'label': 'Pesanan'},
      {'icon': Icons.message_rounded, 'value': '3', 'label': 'Pesan Baru'},
    ];
    return Row(
      children: stats.map((s) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(s['icon'] as IconData,
                    color: AppTheme.primary, size: 28),
                const SizedBox(height: 8),
                Text(
                  s['value'] as String,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  s['label'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textGrey,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeaturedProducts(BuildContext context) {
    final products = [
      {
        'name': 'Sepatu Sport Pro',
        'price': 'Rp 450.000',
        'color': const Color(0xFFE8F4FD),
        'emoji': '👟',
      },
      {
        'name': 'Tas Kerja Elegan',
        'price': 'Rp 320.000',
        'color': const Color(0xFFFFF0F3),
        'emoji': '👜',
      },
    ];
    return Row(
      children: products.map((p) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: p['color'] as Color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p['emoji'] as String,
                  style: const TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 10),
                Text(
                  p['name'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppTheme.textDark,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 4),
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
        );
      }).toList(),
    );
  }

  Widget _buildActivityList(BuildContext context) {
    final activities = [
      {
        'icon': Icons.check_circle_rounded,
        'color': Colors.green,
        'title': 'Pesanan #1042 selesai',
        'time': '2 jam lalu',
      },
      {
        'icon': Icons.local_shipping_rounded,
        'color': Colors.blue,
        'title': 'Pesanan #1041 dikirim',
        'time': '5 jam lalu',
      },
      {
        'icon': Icons.star_rounded,
        'color': Colors.amber,
        'title': 'Ulasan baru diterima',
        'time': '1 hari lalu',
      },
    ];
    return Column(
      children: activities.map((a) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(8),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (a['color'] as Color).withAlpha(30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(a['icon'] as IconData,
                    color: a['color'] as Color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  a['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppTheme.textDark,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Text(
                a['time'] as String,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.textGrey,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
