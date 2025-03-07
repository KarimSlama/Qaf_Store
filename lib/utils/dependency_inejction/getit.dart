import 'package:get_it/get_it.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/data/repository/reset_password_email_repository.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/home_cubit.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_cubit.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_repository.dart';
import 'package:qaf_store/features/screens/login/data/repository/login_social_repository.dart';
import 'package:qaf_store/features/screens/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/data/repository/user_repository.dart';
import 'package:qaf_store/features/screens/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:qaf_store/features/screens/sign_up/data/repo/register_repository.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_cubit.dart';
import 'package:qaf_store/features/screens/verfiy_email/data/repository/verify_email_repository.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_cubit.dart';
import 'package:qaf_store/network/services/auth/auth_service.dart';
import 'package:qaf_store/network/services/auth/auth_service_impl.dart';
import 'package:qaf_store/network/services/sign_in_social/sign_in_social_service.dart';
import 'package:qaf_store/network/services/sign_in_social/sign_in_social_service_impl.dart';
import 'package:qaf_store/network/services/user/user_service.dart';
import 'package:qaf_store/network/services/user/user_service_impl.dart';
import 'package:qaf_store/network/services/verify_email/verify_email_service.dart';
import 'package:qaf_store/network/services/verify_email/verify_email_service_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  getIt.registerLazySingleton<SignInSocialService>(
      () => SignInSocialServiceImpl());
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl());
  getIt.registerLazySingleton<VerifyEmailService>(
      () => VerifyEmailServiceImpl());

  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepository(getIt(), getIt()));
  getIt.registerLazySingleton<LoginSocialRepository>(
      () => LoginSocialRepository(getIt(), getIt()));
  getIt.registerLazySingleton<ResetPasswordEmailRepository>(
      () => ResetPasswordEmailRepository(getIt()));
  getIt.registerLazySingleton<VerifyEmailRepository>(
      () => VerifyEmailRepository(getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));

  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt()));

  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactory<VerifyEmailCubit>(() => VerifyEmailCubit(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  getIt.registerFactory<NavigationCubit>(() => NavigationCubit());

  getIt.registerFactory<UserCubit>(() => UserCubit(getIt(), getIt()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}
