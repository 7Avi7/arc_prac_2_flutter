import 'package:architec_practice2/core/services/authentication_api.dart';
import 'package:architec_practice2/core/view_models/profile_view_model.dart';
import 'package:architec_practice2/core/view_models/sign_in_view_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/profile_api.dart';
import 'core/view_models/base_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => BaseViewModel());
  locator.registerFactory(() => SignInViewModel());
  locator.registerFactory(() => ProfileViewModel());

  locator.registerLazySingleton(() => AuthenticationAPI());
  locator.registerLazySingleton(() => ProfileAPI());
}
