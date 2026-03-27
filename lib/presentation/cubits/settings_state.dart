part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool isDarkMode;
  final bool notificationsEnabled;

  const SettingsState({
    this.isDarkMode = false,
    this.notificationsEnabled = true,
  });

  SettingsState copyWith({
    bool? isDarkMode,
    bool? notificationsEnabled,
  }) {
    return SettingsState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override
  List<Object> get props => [isDarkMode, notificationsEnabled];
}
