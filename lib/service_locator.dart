import 'package:get_it/get_it.dart';
import 'package:test_burger/services/api_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() async {
  // Declaration de Service
  locator.registerLazySingleton<ApiService>(() => ApiService());
}
