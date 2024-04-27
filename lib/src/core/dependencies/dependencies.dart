import 'package:get_it/get_it.dart';
import 'package:weather_app/src/features/home/controller/home_controller.dart';
import 'package:weather_app/src/features/home/data/data_source/home_data_source.dart';
import 'package:weather_app/src/features/home/data/data_source/home_data_source_impl.dart';
import 'package:weather_app/src/features/home/data/repository/home_repository_impl.dart';
import 'package:weather_app/src/features/home/data/repository/home_repository.dart';
import 'package:weather_app/src/features/home/data/use_case/home_use_case.dart';
import 'package:weather_app/src/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;


Future<void> init () async{

  // controller
  sl.registerLazySingleton<HomeController>(() => HomeController());

  // bloc
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(homeUseCase: sl()));

  //repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(dataSource: sl()));

  //use case
  sl.registerLazySingleton<HomeUseCase>(() => HomeUseCase(homeRepository: sl()));

  //data source
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());


  // ///EXTERNAL
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // sl.registerLazySingleton<LocalStorage>(() => LocalStorage(sl<SharedPreferences>()));
}

