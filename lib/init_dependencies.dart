import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:t2dm_mobile/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:t2dm_mobile/core/config/config.dart';
import 'package:t2dm_mobile/features/auth/data/datasources/auth_datasources.dart';
import 'package:t2dm_mobile/features/auth/data/repositories/auth_repository.dart';
import 'package:t2dm_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:t2dm_mobile/features/auth/domain/usecases/current_user.dart';
import 'package:t2dm_mobile/features/auth/domain/usecases/user_login.dart';
import 'package:t2dm_mobile/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  _initAuth();
  // serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl
}

void _initCore() {
  serviceLocator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(
        baseUrl: APIConfig.baseUrl,
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 3000))),
  );

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerLazySingleton<AuthDatasources>(
        () => AuthDatasourcesImpl(serviceLocator()))
    ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    ..registerLazySingleton(() => UserLogin(serviceLocator<AuthRepository>()))
    ..registerLazySingleton(() => CurrentUser(serviceLocator<AuthRepository>()))
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        userLogin: serviceLocator<UserLogin>(),
        currentUser: serviceLocator<CurrentUser>(),
        appUserCubit: serviceLocator<AppUserCubit>(),
      ),
    );
}
