import 'package:ecommerce_bloc/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_bloc/common/widget/app_bar.dart';
import 'package:ecommerce_bloc/presentation/auth/page/sign_up/gender_and_age_select.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/app_button.dart';
import '../../../../data/auth/model/use_crete_req.dart';
import '../sign_in/sigin.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signUpText(context),
              const SizedBox(height: 20),
              _firstNameField(context),
              const SizedBox(height: 20),
              _lastNameField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              _continueButton(context),
              const SizedBox(height: 20),
              _createAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return TextField(
      controller: _firstNameCon,
      decoration: InputDecoration(hintText: 'Enter First name'),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return TextField(
      controller: _lastNameCon,
      decoration: InputDecoration(hintText: 'Enter Last Name'),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(hintText: 'Enter Email address'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
            userCreationReq: UserCreationReq(
              firstName: _firstNameCon.text,
              lastName: _lastNameCon.text,
              email: _emailCon.text,
              password: _passwordCon.text,
            ),
          ),
        );
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Already  have an account? "),
          TextSpan(
            text: 'Sign In now ',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignInPage());
              },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
