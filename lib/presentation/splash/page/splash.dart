import 'package:ecommerce_bloc/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_bloc/core/config/assets/app_vectors.dart';
import 'package:ecommerce_bloc/core/config/theme/app_color.dart';
import 'package:ecommerce_bloc/presentation/auth/page/sign_in/sigin.dart';
import 'package:ecommerce_bloc/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_bloc/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Home/page/home.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SignInPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, HomeView());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: SvgPicture.asset(AppVectors.appLogo)),
      ),
    );
  }
}
