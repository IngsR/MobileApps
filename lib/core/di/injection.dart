import 'package:get_it/get_it.dart';
import '../../presentation/cubits/settings_cubit.dart';
import '../../presentation/cubits/orders_cubit.dart';
import '../../data/repositories/preferences_repository.dart';
import '../../data/repositories/order_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoCs / Cubits
  sl.registerFactory(() => SettingsCubit(sl()));
  sl.registerFactory(() => OrdersCubit(sl()));

  // Repositories
  sl.registerLazySingleton<PreferencesRepository>(() => PreferencesRepository());
  sl.registerLazySingleton<OrderRepository>(() => OrderRepository());

  // Data sources

  
  // Core / External
}
