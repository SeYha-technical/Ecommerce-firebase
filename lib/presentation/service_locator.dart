import 'package:ecommerce_bloc/data/categories/repository/categories.dart';
import 'package:ecommerce_bloc/data/categories/sources/get_categories_service.dart';
import 'package:ecommerce_bloc/data/order/repository/order.dart';
import 'package:ecommerce_bloc/data/order/sources/order_firebase_service.dart';
import 'package:ecommerce_bloc/data/product/repository/product_repo_impl.dart';
import 'package:ecommerce_bloc/data/product/sources/product_fire_service.dart';
import 'package:ecommerce_bloc/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_bloc/domain/auth/usecases/get_user.dart';
import 'package:ecommerce_bloc/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce_bloc/domain/categories/repository/categories.dart';
import 'package:ecommerce_bloc/domain/categories/usecases/cateogries_usecases.dart';
import 'package:ecommerce_bloc/domain/order/repository/order.dart';
import 'package:ecommerce_bloc/domain/order/usecases/add_to_cart.dart';
import 'package:ecommerce_bloc/domain/order/usecases/get_cart.dart';
import 'package:ecommerce_bloc/domain/order/usecases/get_order.dart';
import 'package:ecommerce_bloc/domain/order/usecases/order_restration.dart';
import 'package:ecommerce_bloc/domain/order/usecases/remove_from_cart.dart';
import 'package:ecommerce_bloc/domain/product/repository/product.dart';
import 'package:ecommerce_bloc/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce_bloc/domain/product/usecases/get_pro_by_categories.dart';
import 'package:ecommerce_bloc/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce_bloc/domain/product/usecases/search_by_title.dart';
import 'package:get_it/get_it.dart';
import '../data/auth/repository/auth_repository_impl.dart';
import '../data/auth/sources/auth_firebase_service.dart';
import '../domain/auth/ropository/auth/auth.dart';
import '../domain/auth/usecases/send_password_reset_email.dart';
import '../domain/auth/usecases/signin.dart';
import '../domain/auth/usecases/signup.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  //service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  //repository

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  //useCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<CategoryUseCase>(CategoryUseCase());
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProByCategoriesUseCase>(GetProByCategoriesUseCase());
  sl.registerSingleton<SearchByTitleUseCase>(SearchByTitleUseCase());
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartUseCase>(GetCartUseCase());
  sl.registerSingleton<RemoveFromCartUseCase>(RemoveFromCartUseCase());
  sl.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());
  sl.registerSingleton<GetOrderUseCase>(GetOrderUseCase());
}
