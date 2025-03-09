import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/address/add_new_address_screen.dart';
import 'package:qaf_store/features/screens/address/user_address_screen.dart';
import 'package:qaf_store/features/screens/all_products/all_products_screen.dart';
import 'package:qaf_store/features/screens/brands/all_brands_screen.dart';
import 'package:qaf_store/features/screens/brands/brand_products.dart';
import 'package:qaf_store/features/screens/cart/cart_screen.dart';
import 'package:qaf_store/features/screens/change_name/change_name_screen.dart';
import 'package:qaf_store/features/screens/checkout/checkout_screen.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/forgot_password_screen.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_cubit.dart';
import 'package:qaf_store/features/screens/login/login_screen.dart';
import 'package:qaf_store/features/screens/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:qaf_store/features/screens/onboarding/onboarding_screen.dart';
import 'package:qaf_store/features/screens/order/order_screen.dart';
import 'package:qaf_store/features/screens/product_details/product_details_screen.dart';
import 'package:qaf_store/features/screens/profile/profile_screen.dart';
import 'package:qaf_store/features/screens/profile/widgets/reauth_form.dart';
import 'package:qaf_store/features/screens/reset_password/reset_password_screen.dart';
import 'package:qaf_store/features/screens/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:qaf_store/features/screens/sign_up/sign_up_screen.dart';
import 'package:qaf_store/features/screens/sub_category/sub_category_screen.dart';
import 'package:qaf_store/features/screens/upload_data/controller/cubit/upload_cubit.dart';
import 'package:qaf_store/features/screens/upload_data/upload_data_screen.dart';
import 'package:qaf_store/features/screens/verfiy_email/controller/cubit/verify_email_cubit.dart';
import 'package:qaf_store/features/screens/verfiy_email/verfiy_email_screen.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_cubit.dart';
import 'package:qaf_store/navigation_menu.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OnboardingCubit>(),
            child: OnboardingScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );

      case Routes.verifyScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerifyEmailCubit>(),
            child: VerifyEmailScreen(email: email),
          ),
        );

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ForgotPasswordScreen(),
          ),
        );

      case Routes.resetPasswordScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(email: email),
        );

      case Routes.reAuthScreen:
        return MaterialPageRoute(
          builder: (_) => ReAuthForm(),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );

      case Routes.changeNameScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNameScreen(),
        );

      case Routes.navigationMenu:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NavigationCubit>(),
            child: NavigationMenu(),
          ),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );

      case Routes.subCategoryScreen:
        return MaterialPageRoute(
          builder: (_) => SubCategoryScreen(),
        );

      case Routes.allProductsScreen:
        return MaterialPageRoute(
          builder: (_) => AllProductsScreen(),
        );

      case Routes.productDetailScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(),
        );

      case Routes.checkoutScreen:
        return MaterialPageRoute(
          builder: (_) => CheckoutScreen(),
        );

      case Routes.orderScreen:
        return MaterialPageRoute(
          builder: (_) => OrderScreen(),
        );

      case Routes.brandProductsScreen:
        return MaterialPageRoute(
          builder: (_) => BrandProductsScreen(),
        );

      case Routes.allBrandsScreen:
        return MaterialPageRoute(
          builder: (_) => AllBrandsScreen(),
        );

      case Routes.userAddressScreen:
        return MaterialPageRoute(
          builder: (_) => UserAddressScreen(),
        );

      case Routes.addNewAddressScreen:
        return MaterialPageRoute(
          builder: (_) => AddNewAddressScreen(),
        );

      case Routes.uploadDataScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UploadCubit>(),
            child: UploadDataScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
