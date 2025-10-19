import 'package:ecommerce_bloc/core/config/theme/app_theme.dart';
import 'package:ecommerce_bloc/firebase_options.dart';
import 'package:ecommerce_bloc/presentation/service_locator.dart';
import 'package:ecommerce_bloc/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_bloc/presentation/splash/page/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: SplashView(),
      ),
    );
  }
}
