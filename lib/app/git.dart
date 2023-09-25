import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../data/data_source/data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_imp.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/home_usecase.dart';
import '../presenation/Screen/main_view_model.dart';

final instance = GetIt.instance;
Future<void> initAppModel() async {
  //! network information
  instance.registerLazySingleton<NetworkInformation>(
      () => NetworkInfoImp(InternetConnectionChecker()));

  //! dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  //!app service client

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //! remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImp(instance<AppServiceClient>()));

  //! repository

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
        instance(),
        instance(),
      ));
}

//! HomeView
initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUsecse>()) {
    instance.registerFactory<HomeUsecse>(() => HomeUsecse(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}
