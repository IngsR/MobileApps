import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/universal_app_bar.dart';
import '../widgets/organisms/app_drawer.dart';
import '../cubits/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UniversalAppBar(title: 'Pengaturan'),
      drawer: const AppDrawer(),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Mode Gelap'),
                      subtitle: const Text('Tema gelap di seluruh aplikasi'),
                      secondary: const Icon(Icons.dark_mode_rounded),
                      value: state.isDarkMode,
                      onChanged: (val) => cubit.toggleDarkMode(val),
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      title: const Text('Notifikasi'),
                      subtitle: const Text('Terima pemberitahuan pesanan & promo'),
                      secondary: const Icon(Icons.notifications_active_rounded),
                      value: state.notificationsEnabled,
                      onChanged: (val) => cubit.toggleNotifications(val),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.language_rounded),
                      title: const Text('Bahasa'),
                      trailing: const Text('Indonesia'),
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.security_rounded),
                      title: const Text('Privasi & Keamanan'),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
