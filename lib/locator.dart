import 'package:get_it/get_it.dart';
import 'package:note_padd/home/service/repository.dart';
import 'package:note_padd/home/service/service.dart';
import 'package:note_padd/home/viewmodel/home_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Service());

  locator.registerLazySingleton(() => Repository());

  locator.registerFactory(() => HomeViewModel());
}
