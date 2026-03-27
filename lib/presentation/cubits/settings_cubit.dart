import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/preferences_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final PreferencesRepository _preferencesRepository;

  SettingsCubit(this._preferencesRepository) : super(const SettingsState()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final isDarkMode = await _preferencesRepository.getDarkMode();
    final notificationsEnabled = await _preferencesRepository.getNotificationsEnabled();
    emit(state.copyWith(
      isDarkMode: isDarkMode,
      notificationsEnabled: notificationsEnabled,
    ));
  }

  Future<void> toggleDarkMode(bool value) async {
    await _preferencesRepository.setDarkMode(value);
    emit(state.copyWith(isDarkMode: value));
  }

  Future<void> toggleNotifications(bool value) async {
    await _preferencesRepository.setNotificationsEnabled(value);
    emit(state.copyWith(notificationsEnabled: value));
  }
}
