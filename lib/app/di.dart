import 'package:app_truyen/data/data_source/remote_data_source.dart';
import 'package:app_truyen/data/network/app_api.dart';
import 'package:app_truyen/data/network/dio_factory.dart';
import 'package:app_truyen/data/network/network_info.dart';
import 'package:app_truyen/data/repository_impl/repository_impl.dart';
import 'package:app_truyen/domain/repository/repository.dart';
import 'package:app_truyen/domain/usecase/get_categories_usecare.dart';
import 'package:app_truyen/domain/usecase/get_chapter_detail_usecase.dart';
import 'package:app_truyen/domain/usecase/get_chapter_usecase.dart';
import 'package:app_truyen/domain/usecase/get_stories_usecase.dart';
import 'package:app_truyen/presentation/main/home_page/cubit/home_page_cubit.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  //app service
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));
  //repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

Future<void> initMainModule() async {
  if (!GetIt.I.isRegistered<GetCategoriesUsecase>()) {
    instance.registerFactory<GetCategoriesUsecase>(
        () => GetCategoriesUsecase(instance()));
  }
}

Future<void> initStoriesModule() async {
  if (!GetIt.I.isRegistered<GetStoriesUsecase>()) {
    instance.registerFactory<GetStoriesUsecase>(
        () => GetStoriesUsecase(instance()));
  }
}

Future<void> initStoryDetailModule() async {
  if (!GetIt.I.isRegistered<GetChaptersUsecase>()) {
    instance.registerFactory<GetChaptersUsecase>(
        () => GetChaptersUsecase(instance()));
  }
}

Future<void> initChapterDetailModule() async {
  if (!GetIt.I.isRegistered<GetChapterDetailUsecase>()) {
    instance.registerFactory<GetChapterDetailUsecase>(
        () => GetChapterDetailUsecase(instance()));
  }
}
