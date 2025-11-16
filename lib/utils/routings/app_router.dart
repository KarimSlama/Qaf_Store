import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/address/add_new_address_screen.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/user_address_screen.dart';
import 'package:qaf_store/features/screens/all_products/all_products_screen.dart';
import 'package:qaf_store/features/screens/brands/all_brands_screen.dart';
import 'package:qaf_store/features/screens/brands/brand_products_screen.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_cubit.dart';
import 'package:qaf_store/features/screens/brands/data/models/brand_model.dart';
import 'package:qaf_store/features/screens/cart/cart_screen.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/change_name/change_name_screen.dart';
import 'package:qaf_store/features/screens/checkout/checkout_screen.dart';
import 'package:qaf_store/features/screens/checkout/controller/cubit/checkout_cubit.dart';
import 'package:qaf_store/features/screens/customer_service/cubit/customer_service_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/controller/cubit/reset_password_cubit.dart';
import 'package:qaf_store/features/screens/forgot_password/forgot_password_screen.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/home/data/models/category_model.dart';
import 'package:qaf_store/features/screens/home/data/models/product_model.dart';
import 'package:qaf_store/features/screens/login/controller/cubit/login_cubit.dart';
import 'package:qaf_store/features/screens/login/login_screen.dart';
import 'package:qaf_store/features/screens/onboarding/controller/cubit/onboarding_cubit.dart';
import 'package:qaf_store/features/screens/onboarding/onboarding_screen.dart';
import 'package:qaf_store/features/screens/order/controller/cubit/order_cubit.dart';
import 'package:qaf_store/features/screens/order/order_screen.dart';
import 'package:qaf_store/features/screens/product_details/controller/cubit/product_details_cubit.dart';
import 'package:qaf_store/features/screens/product_details/product_details_screen.dart';
import 'package:qaf_store/features/screens/product_reivews/product_reviews_screen.dart';
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

import '../../features/screens/customer_service/customer_service_screen.dart';

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
          builder: (_) => BlocProvider.value(
            value: getIt<CartCubit>(),
            child: CartScreen(),
          ),
        );

      case Routes.subCategoryScreen:
        final category = settings.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductCubit>()
              ..fetchProductsForCategory(categoryId: category.id),
            child: SubCategoryScreen(category: category),
          ),
        );

      case Routes.allProductsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<ProductCubit>(),
            child: AllProductsScreen(
              title: 'Popular Products',
              query: FirebaseFirestore.instance
                  .collection('Products')
                  .where('IsFeatured', isEqualTo: true),
            ),
          ),
        );

      case Routes.productDetailScreen:
        final products = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductDetailsCubit>(),
            child: ProductDetailsScreen(products: products),
          ),
        );

      case Routes.productReviewScreen:
        return MaterialPageRoute(
          builder: (_) => ProductReviewsScreen(),
        );

      case Routes.checkoutScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<CheckoutCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<OrderCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<AddressesCubit>(),
              ),
              BlocProvider.value(
                value: getIt<CartCubit>(),
              ),
            ],
            child: CheckoutScreen(),
          ),
        );

      case Routes.orderScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<OrderCubit>()..fetchUserOrders(),
            child: OrderScreen(),
          ),
        );

      case Routes.brandProductsScreen:
        final brands = settings.arguments as BrandModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<ProductCubit>(),
            child: BrandProductsScreen(brands: brands),
          ),
        );

      case Routes.allBrandsScreen:
        final brands = settings.arguments as List<BrandModel>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<BrandCubit>(),
            child: AllBrandsScreen(brands: brands),
          ),
        );

      case Routes.userAddressScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddressesCubit>()..fetchAllUserAddress(),
            child: UserAddressScreen(),
          ),
        );

      case Routes.addNewAddressScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AddressesCubit>(),
            child: AddNewAddressScreen(),
          ),
        );

      case Routes.uploadDataScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UploadCubit>(),
            child: UploadDataScreen(),
          ),
        );

      case Routes.customerServiceScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CustomerServiceCubit>(),
            child: const CustomerServiceScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
