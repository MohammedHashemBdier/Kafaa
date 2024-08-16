import 'package:get_it/get_it.dart';
import 'package:kafaa_app/blocs/auth/auth_bloc.dart';
import 'package:kafaa_app/blocs/employees/employees/employees_bloc.dart';
import 'package:kafaa_app/blocs/evaluations/evaluations/evaluations_bloc.dart';
import 'package:kafaa_app/blocs/localization/localization_bloc.dart';
import 'package:kafaa_app/blocs/settings/settings_bloc.dart';
import 'package:kafaa_app/repos/auth_repo.dart';
import 'package:kafaa_app/repos/employees_repo.dart';
import 'package:kafaa_app/repos/evaluations_repo.dart';
import 'package:kafaa_app/repos/localization_repo.dart';
import 'package:kafaa_app/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

late GetIt locator;

Future<void> dependencyInjection() async {
  locator = GetIt.instance;

  locator.registerSingleton(await SharedPreferences.getInstance());
  locator.registerSingleton(DioClient());

  locator.registerLazySingleton(
    () => AuthRepo(pref: locator(), client: locator()),
  );

  locator.registerLazySingleton(
    () => LocalizationRepo(client: locator()),
  );

  locator.registerLazySingleton(
    () => EmployeesRepo(client: locator()),
  );

  locator.registerLazySingleton(
    () => EvaluationsRepo(client: locator()),
  );

  locator.registerFactory(() => LocalizationBloc(localizationRepo: locator()));

  locator.registerFactory(() => AuthBloc(authRepo: locator()));

  locator.registerFactory(() => EmployeesBloc(
        employeesRepo: locator(),
        authRepo: locator(),
      ));

  locator.registerFactory(() => EvaluationsBloc(
        evaluationsRepo: locator(),
        authRepo: locator(),
      ));

  locator.registerFactory(() => SettingsBloc(authRepo: locator()));
}
