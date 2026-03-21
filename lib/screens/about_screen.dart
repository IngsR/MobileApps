import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Logo App
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primary, AppTheme.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primary.withAlpha(80),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Simple App',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'Versi 1.0.0',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textGrey,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '🛍️ Belanja Mudah, Cepat & Aman',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Info Cards
              _buildInfoCard(
                icon: Icons.info_outline_rounded,
                title: 'Tentang Aplikasi',
                content:
                    'Simple App adalah aplikasi belanja online yang dirancang untuk memudahkan pengguna berbelanja produk berkualitas dengan harga terbaik langsung dari smartphone.',
              ),
              const SizedBox(height: 14),
              _buildInfoCard(
                icon: Icons.star_outline_rounded,
                title: 'Fitur Unggulan',
                content:
                    '✅ Katalog Produk Lengkap\n✅ Keranjang Belanja Pintar\n✅ Chat Langsung dengan Penjual\n✅ Notifikasi Real-time',
              ),
              const SizedBox(height: 14),
              _buildInfoCard(
                icon: Icons.person_outline_rounded,
                title: 'Developer',
                content: '👨‍💻 Dikembangkan oleh Tim Simple App\n📧 dev@simpleapp.id\n🌐 www.simpleapp.id',
              ),
              const SizedBox(height: 30),

              // Copyright
              Text(
                '© 2026 Simple App. All rights reserved.',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textGrey,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.primary, size: 22),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppTheme.textDark,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textGrey,
              height: 1.7,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
