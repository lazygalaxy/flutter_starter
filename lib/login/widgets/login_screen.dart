import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/auth/auth_repository.dart';
import 'package:flutter_starter/login/bloc/login_bloc.dart';
import 'package:flutter_starter/login/widgets/login_form.dart';
import 'package:flutter_starter/constants.dart';

class LoginScreen extends StatelessWidget {
  final AuthRepository _authRepository;

  LoginScreen(AuthRepository authRepository)
      : _authRepository = authRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME + ' - Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(authRepository: _authRepository),
        child: LoginForm(authRepository: _authRepository),
      ),
    );
  }
}
