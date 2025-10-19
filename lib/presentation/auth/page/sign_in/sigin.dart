import 'package:ecommerce_bloc/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_bloc/common/widget/app_bar.dart';
import 'package:ecommerce_bloc/presentation/auth/page/sign_in/enter_password.dart';
import 'package:ecommerce_bloc/presentation/auth/page/sign_up/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/app_button.dart';
import '../../../../data/auth/model/user_sigin_req.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signInText(context),
            const SizedBox(height: 20),
            _emailField(context),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 20),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: 'Enter Email'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          EnterPasswordPage(signinReq: UserSigninReq(email: _emailCon.text)),
        );
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: 'Create one',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignUpPage());
              },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
