import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/market_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/messages_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // 0=Home, 1=Market, 2=Cart, 3=Messages, 4=About
  final List<Widget> _screens = const [
    HomeScreen(),
    MarketScreen(),
    CartScreen(),
    MessagesScreen(),
    AboutScreen(),
  ];

  final List<String> _titles = [
    'Beranda',
    'Pasar',
    'Keranjang',
    'Pesan',
    'Tentang',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          if (_currentIndex == 0)
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          const SizedBox(width: 4),
        ],
      ),
      body: _screens[_currentIndex],
      floatingActionButton: _buildCenterFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCenterFAB() {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 0),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppTheme.primaryLight, AppTheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withAlpha(100),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          _currentIndex == 0 ? Icons.home_rounded : Icons.home_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      color: AppTheme.navBackground,
      elevation: 0,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Kiri: Market & Cart
            _buildNavItem(Icons.storefront_rounded, Icons.storefront_outlined, 'Market', 1),
            _buildNavItem(Icons.shopping_cart_rounded, Icons.shopping_cart_outlined, 'Keranjang', 2),

            // Tengah kosong (untuk FAB)
            const SizedBox(width: 60),

            // Kanan: Messages & About
            _buildNavItem(Icons.message_rounded, Icons.message_outlined, 'Pesan', 3),
            _buildNavItem(Icons.info_rounded, Icons.info_outlined, 'Tentang', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData activeIcon, IconData inactiveIcon, String label, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      key: ValueKey('nav_$index'),
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isActive ? activeIcon : inactiveIcon,
            color: isActive ? AppTheme.accent : Colors.white54,
            size: 24,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppTheme.accent : Colors.white54,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
