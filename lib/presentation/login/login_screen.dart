import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lanars_demo/presentation/common/widgets/active_button.dart';
import 'package:lanars_demo/presentation/common/widgets/email_field.dart';
import 'package:lanars_demo/presentation/common/widgets/password_text_field.dart';

import '../../resources/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();

  void checkValidation() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailField(controller: _emailController, focusNode: _emailFocus, onFieldSubmitted: (v) => _passFocus.requestFocus()),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: PasswordTextField(controller: _passController, focusNode: _passFocus),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44.0),
                child: ActiveButton(onPressed: () => checkValidation(), text: AppStrings.login, isActive: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
