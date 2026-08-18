import 'package:get_it/get_it.dart';

import '../../features/layout/presentation/manager/layout_cubit.dart';
import '../../l10n/controller/locale_cubit.dart';
import '../data/app_local_data.dart';
import '../data/hive_services.dart';
import '../network/network_service.dart';
import '../utils/connectivity_services.dart';

final sl = GetIt.instance;

class ServiceLocator {

  void setup() {
  /// Network
  sl.registerLazySingleton<ApiService>(() => ApiService());

  /// AppLocalData
  sl.registerSingleton<AppLocalData>(AppLocalData());
  sl.registerLazySingleton<HiveService>(() => HiveService());
  sl.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

  /// Cubits
  sl.registerLazySingleton(() => LocaleCubit());
  sl.registerLazySingleton(() => LayoutCubit());
}
}
