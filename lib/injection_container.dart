import 'package:get_it/get_it.dart';
import 'package:my_template_project/core/routes/auth_guard.dart';
import 'package:my_template_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_template_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_template_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_template_project/features/auth/domain/usecases/login.dart';
import 'package:my_template_project/features/auth/domain/usecases/logout.dart';
import 'package:my_template_project/features/auth/domain/usecases/register_token.dart';
import 'package:my_template_project/features/auth/domain/usecases/signup.dart';
import 'package:my_template_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:my_template_project/features/auth/presentation/bloc/token_bloc.dart';
import 'package:my_template_project/features/brand/data/datasources/brand_remote_data_source.dart';
import 'package:my_template_project/features/brand/domain/repositories/brand_repository.dart';
import 'package:my_template_project/features/brand/domain/usecases/fetch_brand.dart';
import 'package:my_template_project/features/brand/domain/usecases/fetch_related_brand.dart';
import 'package:my_template_project/features/brand/domain/usecases/update_brand.dart';
import 'package:my_template_project/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:my_template_project/features/brand/presentation/bloc/related_users_bloc.dart';
import 'package:my_template_project/features/ibeacon_scanner/data/datasources/ibeacon_scanner_remote_data_source.dart';
import 'package:my_template_project/features/ibeacon_scanner/data/repositories/beacon_scanner_repository_impl.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/repositories/beacon_scanner_repository.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/usecases/add_appointment.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/usecases/fetch_transmitter.dart';
import 'package:my_template_project/features/ibeacon_scanner/domain/usecases/send_notification.dart';
import 'package:my_template_project/features/ibeacon_scanner/presentation/bloc/appointment_bloc.dart';
import 'package:my_template_project/features/ibeacon_scanner/presentation/bloc/beacon_scanner_bloc.dart';
import 'package:my_template_project/features/info/data/datasources/info_remote_data_source.dart';
import 'package:my_template_project/features/info/data/repositories/info_repository_impl.dart';
import 'package:my_template_project/features/info/domain/repositories/info_repository.dart';
import 'package:my_template_project/features/info/domain/usecases/get_info.dart';
import 'package:my_template_project/features/info/presentation/bloc/info_bloc.dart';
import 'package:my_template_project/features/info/presentation/bloc/info_notification_bloc.dart';
import 'package:my_template_project/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:my_template_project/features/notification/data/repositories/notification_repository.dart';
import 'package:my_template_project/features/notification/domain/repositories/notification_repository_impl.dart';
import 'package:my_template_project/features/notification/domain/usecases/change_rank.dart';
import 'package:my_template_project/features/notification/presentation/bloc/notification_confirmation_bloc.dart';
import 'package:my_template_project/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:my_template_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:my_template_project/features/profile/domain/usecases/fetch_profile.dart';
import 'package:my_template_project/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:my_template_project/features/register/data/datasources/register_data_source.dart';
import 'package:my_template_project/features/register/domain/repositories/register_repository.dart';
import 'package:my_template_project/features/register/domain/usecases/register_user.dart';
import 'package:my_template_project/features/register/presentation/bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/config/ably_service.dart';
import 'features/brand/data/repositories/brand_repository_impl.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/register/data/repositories/register_repository_impl.dart';

final sl = GetIt.instance;
Future<void> init()async{

  //! Feature - Auth
  //BLOC
  sl.registerFactory(()=>AuthBloc(sl(),sl(),sl()));
  sl.registerFactory(()=>TokenBloc(sl()));
  //USE CASES
  sl.registerLazySingleton(()=>AuthGuard(sl()));
  sl.registerLazySingleton(()=>Logout(sharedPreferences: sl()));
  sl.registerLazySingleton(()=>LoginUseCase(sl()));
  sl.registerLazySingleton(()=>SignupUseCase(sl()));
  sl.registerLazySingleton(()=>RegisterToken(sl()));
  //REPOSITORY
  sl.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl(sharedPreferences: sl(), authRemoteDataSource: sl()));
  //DATASOURCE
  sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(client: sl(), sharedPreferences: sl(),));

  //! Feature - Info
  //BLOC
  sl.registerFactory(()=>InfoBloc(sl()));
  sl.registerFactory(()=>InfoNotificationBloc());
  //USE CASES
  sl.registerLazySingleton(()=>GetInfo(sl()));
  //REPOSITORY
  sl.registerLazySingleton<InfoRepository>(()=> InfoRepositoryImpl(sl()));
  //DATASOURCE
  sl.registerLazySingleton<InfoRemoteDataSource>(()=>InfoRemoteDataSourceImpl(sl(), sl()));

  //! Feature - Profile
  //BLOC
  sl.registerFactory(()=>ProfileBloc(sl()));
  //USE CASES
  sl.registerLazySingleton(()=>FetchProfile(sl()));
  //REPOSITORY
  sl.registerLazySingleton<ProfileRepository>( ()=> ProfileRepositoryImpl(sl()));
  //DATASOURCE
  sl.registerLazySingleton<ProfileRemoteDataSource>(()=>ProfileRemoteDataSourceImpl(sl(), sl()));

  //! Feature - Register
  //BLOC
  sl.registerFactory(()=>RegisterBloc(sl()));
  //USE CASES
  sl.registerLazySingleton(()=>RegisterUser(sl()));
  //REPOSITORY
  sl.registerLazySingleton<RegisterRepository>(()=>RegisterRepositoryImpl(sl()));
  sl.registerLazySingleton<RegisterRemoteDataSource>(()=>RegisterRemoteDataSourceImpl(sl(),sl()));

  //! Feature - Brand
  //BLOC
  sl.registerFactory(()=>BrandBloc(sl()));
  sl.registerFactory(()=>RelatedUsersBloc(sl(),sl()));
  //USE CASES
  sl.registerLazySingleton(()=>FetchBrand(sl()));
  sl.registerLazySingleton(()=>FetchRelatedBrand(sl()));
  sl.registerLazySingleton(()=>UpdateBrand(sl()));
  //REPOSITORY
  sl.registerLazySingleton<BrandRepository>(()=>BrandRepositoryImpl(sl()));
  //DATASOURCE
  sl.registerLazySingleton<BrandRemoteDataSource>(()=> BrandRemoteDataSourceImpl(sl(),sl()));

  //! Feature - Scanner
  //BLOC
  sl.registerFactory(()=>BeaconScannerBloc(sl(), sl(),sl()));
  sl.registerFactory(()=>AppointmentBloc(sl()));
  //USE CASES
  sl.registerLazySingleton(()=>FetchTransmitter(sl()));
  sl.registerLazySingleton(()=>SendNotification(sl()));
  sl.registerLazySingleton(()=>AddAppointment(sl()));
  //REPOSITORY
  sl.registerLazySingleton<BeaconScannerRepository>(()=>BeaconScannerRepositoryImpl(sl()));
  //DATASOURCE
  sl.registerLazySingleton<ScannerRemoteDatasource>(()=>ScannerRemoteDataSourceImpl(sl(), sl()));

  //! Feature - notification
  sl.registerFactory(()=>NotificationConfirmationBloc());
  // USE CASE
  sl.registerLazySingleton(()=>ChangeRank(sl()));
  // REPOSITORY
  sl.registerLazySingleton<NotificationRepository>(()=>NotificationRepositoryImpl(sl()));
  //DATASOURCE
  sl.registerLazySingleton<NotificationRemoteDataSource>(()=>NotificationRemoteDataSourceImpl(sl(),sl()));


  //EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(()=>sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<AblyService>(() {
    final ablyService = AblyService();
    ablyService.initAbly(); // Initialisation du service
    return ablyService;
  });
}
