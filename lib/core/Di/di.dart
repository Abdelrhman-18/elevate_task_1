import 'package:dio/dio.dart';
import 'package:elevate_task/core/Network/Api_Service/apiConsumer.dart';
import 'package:elevate_task/core/Network/Dic_NetWork/DoiService.dart';
import 'package:elevate_task/core/Network/Dic_NetWork/diofactory.dart';
import 'package:elevate_task/features/Home/Data/Repository/ProductRepository.dart';
import 'package:elevate_task/features/Home/Data/Repository/productRepositoryImpl.dart';
import 'package:elevate_task/features/Home/Logic/product_cubit.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setGetIt() {
  /// dio
  getIt.registerLazySingleton<Dio>(() => DioFactory().dio);

  /// api consumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioService(dio: getIt<Dio>()));

  ///TODO: for home
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt<ApiConsumer>()));
  getIt.registerLazySingleton<ProductCubit>(
      () => ProductCubit(getIt<ProductRepository>()));
}
