import 'package:get_it/get_it.dart';
import 'package:portfolio/data/local_data_source/local_data_source.dart';
import 'package:portfolio/data/remote_data_source/remote_data_source.dart';
import 'package:portfolio/data/remote_data_source/user_api_service.dart';
import 'package:portfolio/data/local_data_source/secure_token_service.dart';
import 'package:portfolio/data/remote_data_source/dio_service.dart';
import 'package:portfolio/data/mapper/user_mapper.dart';
import 'package:portfolio/data/repositories/user_repository_imp.dart';
import 'package:portfolio/domain/repository_interfaces/user_repository.dart';
import 'package:portfolio/presentation/login_scene/bloc/login_bloc.dart';
import 'package:portfolio/presentation/sign_up_scene/bloc/sign_up_bloc.dart';

class DependencyInjector {
  static final getIt = GetIt.instance;

  static void setup() {
    // DioService 등록
    getIt.registerLazySingleton<DioService>(() => DioService(getIt<SecureTokenService>()));

    // SecureTokenService와 UserApiService 등록
    getIt.registerLazySingleton<SecureTokenService>(() => SecureTokenService());
    getIt.registerLazySingleton<UserApiService>(() => UserApiService(getIt<DioService>()));

    // DataSource 등록
    getIt.registerLazySingleton<LocalDataSource>(
            () => LocalDataSource(getIt<SecureTokenService>()));
    getIt.registerLazySingleton<RemoteDataSource>(
            () => RemoteDataSource(getIt<UserApiService>()));

    // UserMapper 등록
    getIt.registerLazySingleton<UserMapper>(() => UserMapper());

    // Repository 등록
    getIt.registerLazySingleton<IUserRepository>(() => UserRepository(
      getIt<RemoteDataSource>(),
      getIt<LocalDataSource>(),
      getIt<UserMapper>(),
    ));

    // Bloc 등록
    getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt<IUserRepository>()));
    getIt.registerFactory<SignUpBloc>(()=> SignUpBloc(getIt<IUserRepository>()));

  }
}