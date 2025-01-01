import 'package:get_it/get_it.dart';
import 'package:my_template_project/core/routes/auth_guard.dart';
import 'package:my_template_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_template_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_template_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_template_project/features/auth/domain/usecases/login.dart';
import 'package:my_template_project/features/auth/domain/usecases/logout.dart';
import 'package:my_template_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init()async{

  //! Feature - Auth
  //BLOC
  sl.registerFactory(()=>AuthBloc(sl()));

  //USE CASES
  sl.registerLazySingleton(()=>AuthGuard(sl()));
  sl.registerLazySingleton(()=>Logout(sharedPreferences: sl()));
  sl.registerLazySingleton(()=>LoginUseCase(sl()));
  //REPOSITORY
  sl.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl(sharedPreferences: sl(), authRemoteDataSource: sl()));
  //DATASOURCE
  sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(client: sl()));

  //EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(()=>sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
