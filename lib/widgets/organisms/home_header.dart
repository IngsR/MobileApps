import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'Selamat Pagi';
    if (hour < 15) return 'Selamat Siang';
    if (hour < 18) return 'Selamat Sore';
    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
          // BURGER MENU / POPUP MENU
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
            onSelected: (value) {
              if (value == 'profil') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Profil ditekan')));
              } else if (value == 'pengaturan') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menu Pengaturan ditekan')));
              } else if (value == 'bantuan') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pusat Bantuan dll')));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profil',
                child: Row(
                  children: [Icon(Icons.person_rounded, color: AppTheme.textGrey, size: 20), SizedBox(width: 10), Text('Profil')],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'pengaturan',
                child: Row(
                  children: [Icon(Icons.settings_rounded, color: AppTheme.textGrey, size: 20), SizedBox(width: 10), Text('Pengaturan')],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'bantuan',
                child: Row(
                  children: [Icon(Icons.help_outline_rounded, color: AppTheme.textGrey, size: 20), SizedBox(width: 10), Text('Bantuan & Dukungan')],
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white.withAlpha(50),
            child: const Text(
              'BS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
