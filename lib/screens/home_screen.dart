import 'package:flutter/material.dart';
import '../widgets/organisms/home_header.dart';
import '../widgets/organisms/home_stats_row.dart';
import '../widgets/organisms/featured_products_section.dart';
import '../widgets/organisms/recent_activity_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Greeting & Menu
              const HomeHeader(),
              const SizedBox(height: 24),

              // Stats Cards
              const HomeStatsRow(),
              const SizedBox(height: 28),

              // Section: Produk Unggulan
              Text(
                'Produk Unggulan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const FeaturedProductsSection(),
              const SizedBox(height: 28),

              // Section: Aktivitas Terbaru
              Text(
                'Aktivitas Terbaru',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              const RecentActivitySection(),
            ],
          ),
        ),
      ),
    );
  }
}
