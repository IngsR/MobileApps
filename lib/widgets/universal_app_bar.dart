import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class UniversalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBurgerMenu;

  const UniversalAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBurgerMenu = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actions: [
        if (actions != null) ...actions!,
        if (showBurgerMenu)
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu_rounded, color: AppTheme.textDark, size: 28),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onSelected: (value) {
              if (value == 'profil') {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Menu Profil ditekan')));
              } else if (value == 'pengaturan') {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Menu Pengaturan ditekan')));
              } else if (value == 'bantuan') {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pusat Bantuan dll')));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profil',
                child: Row(
                  children: [
                    Icon(Icons.person_rounded, color: AppTheme.textGrey, size: 20),
                    SizedBox(width: 10),
                    Text('Profil', style: TextStyle(fontFamily: 'Poppins'))
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'pengaturan',
                child: Row(
                  children: [
                    Icon(Icons.settings_rounded, color: AppTheme.textGrey, size: 20),
                    SizedBox(width: 10),
                    Text('Pengaturan', style: TextStyle(fontFamily: 'Poppins'))
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'bantuan',
                child: Row(
                  children: [
                    Icon(Icons.help_outline_rounded,
                        color: AppTheme.textGrey, size: 20),
                    SizedBox(width: 10),
                    Text('Bantuan', style: TextStyle(fontFamily: 'Poppins'))
                  ],
                ),
              ),
            ],
          ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
