import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wahg_v1/commons/caching/app_settings_cache.dart';
import 'package:wahg_v1/features/data/datasource/remote/auth/auth_firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/auth/auth_firebase_datasource_imp.dart';
import 'package:wahg_v1/features/data/datasource/remote/firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/firebase_datasource_imp.dart';
import 'package:wahg_v1/features/data/datasource/remote/jobs/job_firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/jobs/job_firebase_datasource_imp.dart';
import 'package:wahg_v1/features/data/datasource/remote/offers/offer_firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/offers/offer_firebase_datasource_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/auth/auth_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/cafe_and_restaurant_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/category_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/dress_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/hair_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/hall_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/jobs/job_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/makeup_artist_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/offers/offer_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/photographer_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/suit_repository_imp.dart';
import 'package:wahg_v1/features/data/repository_imp/travel_repository_imp.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/respositories/auth/auth_repository.dart';
import 'package:wahg_v1/features/domain/respositories/cafe_and_restaurant_repository.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/dress_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hair_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/jobs/job_repository.dart';
import 'package:wahg_v1/features/domain/respositories/makeup_artist_repository.dart';
import 'package:wahg_v1/features/domain/respositories/offer/offer_repository.dart';
import 'package:wahg_v1/features/domain/respositories/photographer_repository.dart';
import 'package:wahg_v1/features/domain/respositories/suit_repository.dart';
import 'package:wahg_v1/features/domain/respositories/travel_repository.dart';
import 'package:wahg_v1/features/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_all_users_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_create_current_user_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_current_user_id.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/get_update_user_usercase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/google_auth_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/is_sign_in_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/sign__up_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/sign_in_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/sign_out_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/auth/skip_sign_in_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_cafe_and_restaurant_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_categories_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_dress_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_hair_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_makeup_artist_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_photographer_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_suit_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_travel_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/jobs/job_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/offers/get_offer_usecase.dart';
import 'package:wahg_v1/features/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/auth/cubit/auth_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/credentail/cubit/credential_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/0.0_auth/auth_cubit/user/user_cubit.dart';
import 'package:wahg_v1/features/presentation/pages/2.0_halls_list_page/bloc/halls_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.1_dress_list_page/bloc/dresses_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.2_photographer_list_page/bloc/photographer_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.3_cafe_and_restaurant_list_page/bloc/cafe_and_restaurant_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.4_hair_list_page/bloc/hair_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.5_suit_list_page/bloc/suit_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.6_travel_list_page/bloc/travel_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/2.7_makeup_artist_list_page/bloc/makeup_artist_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/3.0_jobs_list_page/bloc/jobs_bloc.dart';
import 'package:wahg_v1/features/presentation/pages/4.0_offers_list_page/bloc/offers_bloc.dart';
import 'package:wahg_v1/theme/theme_helper.dart';

String authUid = "--";
final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc,Cubit
  sl.registerSingleton<CategoryBloc>(CategoryBloc());
  sl.registerSingleton<HallsBloc>(HallsBloc());
  sl.registerSingleton<DressesBloc>(DressesBloc());
  sl.registerSingleton<PhotographerBloc>(PhotographerBloc());
  sl.registerSingleton<CafeAndRestaurantBloc>(CafeAndRestaurantBloc());
  sl.registerSingleton<HairBloc>(HairBloc());
  sl.registerSingleton<SuitBloc>(SuitBloc());
  sl.registerSingleton<TravelBloc>(TravelBloc());
  sl.registerSingleton<MakeupArtistBloc>(MakeupArtistBloc());
  sl.registerSingleton<JobsBloc>(JobsBloc());
  sl.registerSingleton<OffersBloc>(OffersBloc());

  //Auth Cubit --------------------------------------------------------

  sl.registerFactory<AuthCubit>(
    //get new instance
    () => AuthCubit(
      isSignInUseCase: sl.call(),
      getCurrentUserIdUseCase: sl.call(),
      signOutUseCase: sl.call(),
    ),
  );
  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
        signInUseCase: sl.call(),
    skipSignInUseCase: sl.call(),
        signUpUseCase: sl.call(),
        forgotPasswordUseCase: sl.call(),
        getCreateCurrentUserUseCase: sl.call(),
        googleAuthUseCase: sl.call(),
      ));



  sl.registerFactory<UserCubit>(
    //get new instance
    () => UserCubit(
      getAllUserUseCase: sl.call(),
      getCurrentUserUseCase: sl.call(),
      getUpdateUserUseCase: sl.call(),
    ),
  );
  //---------------------------------------------------------------------

  /// UseCases --------------------------------------------------------
  sl.registerLazySingleton<GetCategoryUseCase>(
      () => GetCategoryUseCase(categoryRepository: sl.call()));
  sl.registerLazySingleton<GetHallUseCase>(
      () => GetHallUseCase(hallRepository: sl.call()));
  sl.registerLazySingleton<GetDressesUseCase>(
      () => GetDressesUseCase(dressRepository: sl.call()));
  sl.registerLazySingleton<GetPhotographerUseCase>(
      () => GetPhotographerUseCase(photographerRepository: sl.call()));
  sl.registerLazySingleton<GetCafeAndRestaurantUseCase>(() =>
      GetCafeAndRestaurantUseCase(cafeAndRestaurantRepository: sl.call()));
  sl.registerLazySingleton<GetHairUseCase>(
      () => GetHairUseCase(hairRepository: sl.call()));
  sl.registerLazySingleton<GetSuitUseCase>(
      () => GetSuitUseCase(suitRepository: sl.call()));
  sl.registerLazySingleton<GetTravelUseCase>(
      () => GetTravelUseCase(travelRepository: sl.call()));
  sl.registerLazySingleton<GetMakeupArtistUseCase>(
      () => GetMakeupArtistUseCase(makeupArtistRepository: sl.call()));
  sl.registerLazySingleton<GetJobUseCase>(
      () => GetJobUseCase(jobRepository: sl.call()));
  sl.registerLazySingleton<GetOfferUseCase>(
      () => GetOfferUseCase(offerRepository: sl.call()));

  //Auth Cubit UseCase --------------------------------------------------------

  sl.registerLazySingleton<GetCurrentUserIdUseCase>(
      () => GetCurrentUserIdUseCase(authRepository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(authRepository: sl.call()));

  //CredentialCubit UseCase
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(authRepository: sl.call()));
  sl.registerLazySingleton<SkipSignInUseCase>(
          () => SkipSignInUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<GetUpdateUserUseCase>(
      () => GetUpdateUserUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<GetAllUserUseCase>(
      () => GetAllUserUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(authRepository: sl.call()));

  sl.registerLazySingleton<GoogleAuthUseCase>(
      () => GoogleAuthUseCase(authRepository: sl.call()));
  // ------------------------------------------------------------------------

  /// Repositories ----------------------------------------------------------
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<HallRepository>(
      () => HallRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<DressRepository>(
      () => DressRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<PhotographerRepository>(
      () => PhotographerRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<CafeAndRestaurantRepository>(
      () => CafeAndRestaurantRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<HairRepository>(
      () => HairRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<SuitRepository>(
      () => SuitRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<TravelRepository>(
      () => TravelRepositoryImp(remoteDataSource: sl.call()));
  sl.registerLazySingleton<MakeupArtistRepository>(
      () => MakeupArtistRepositoryImp(remoteDataSource: sl.call()));

  sl.registerLazySingleton<JobRepository>(
      () => JobRepositoryImp(jobRemoteDataSource: sl.call()));
  sl.registerLazySingleton<OfferRepository>(
      () => OfferRepositoryImp(offerRemoteDataSource: sl.call()));

  // Auth Repository ------------------------------------------------------
  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImp(authRemoteDataSource: sl.call()));
  //-----------------------------------------------------------------------


  /// DataSourece ---------------------------------------------------------
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImp(
          firestore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));
  sl.registerLazySingleton<JobsFirebaseRemoteDataSource>(() =>
      JobsFirebaseRemoteDataSourceImp(
          firestore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));
  sl.registerLazySingleton<OffersFirebaseRemoteDataSource>(() =>
      OffersFirebaseRemoteDataSourceImp(
          firestore: sl.call(), auth: sl.call(), googleSignIn: sl.call()));

  //Auth Remote datasource --------------------------------------------------
  sl.registerLazySingleton<AuthFirebaseRemoteDataSource>(
          () => AuthFirebaseRemoteDataSourceImp(
        firestore: sl.call(),
        auth: sl.call(),
        googleSignIn: sl.call(),
      ));
  //--------------------------------------------------------------------------

  // Local
  sl.registerSingletonAsync<SharedPreferences>(() {
    print('[✅ Initialized] SharedPreference Initialized in di');
    return SharedPreferences.getInstance();
  });
  sl.registerSingleton<AppSettingsCache>(AppSettingsCache(),
      signalsReady: true);

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSigIn = GoogleSignIn();

  sl.registerLazySingleton<FirebaseAuth>(() => auth);
  sl.registerLazySingleton<FirebaseFirestore>(() => fireStore);
  sl.registerLazySingleton<GoogleSignIn>(() => googleSigIn);
}
