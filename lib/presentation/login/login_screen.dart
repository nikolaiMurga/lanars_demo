import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_demo/presentation/common/helpers/app_navigator.dart';
import 'package:lanars_demo/presentation/common/widgets/active_button.dart';
import 'package:lanars_demo/presentation/common/widgets/email_field.dart';
import 'package:lanars_demo/presentation/common/widgets/password_text_field.dart';
import 'package:lanars_demo/presentation/login/bloc/login_cubit.dart';

import '../../resources/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final _cubit = context.read<LoginCubit>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'aa@aa.aa');
  final _passController = TextEditingController(text: 'aaAA99');
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();

  void checkValidation() {
    if (_formKey.currentState!.validate()) {
      _cubit.login(email: _emailController.text, password: _passController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucceed) AppNavigator().goToHomePage();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) => Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    onFieldSubmitted: (v) => _passFocus.requestFocus(),
                    enabled: _cubit.isActiveUI,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: PasswordTextField(controller: _passController, focusNode: _passFocus, enabled: _cubit.isActiveUI),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 44.0),
                    child: ActiveButton(onPressed: () => checkValidation(), text: AppStrings.login, isActive: _cubit.isActiveUI),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
