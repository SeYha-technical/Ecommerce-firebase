import 'package:ecommerce_bloc/presentation/auth/page/sign_in/sigin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helper/navigator/app_navigator.dart';
import '../../../../common/widget/app_button.dart';
import '../../../../core/config/assets/app_vectors.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(height: 30),
          _sentEmail(),
          const SizedBox(height: 30),
          _returnToLoginButton(context),
        ],
      ),
    );
  }

  Widget _emailSending() {
    return Center(child: SvgPicture.asset(AppVectors.emailSending));
  }

  Widget _sentEmail() {
    return const Center(
      child: Text('We Sent you an Email to reset your password.'),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacement(context, SignInPage());
      },
      width: 200,
      title: 'Return to Login',
    );
  }
}
