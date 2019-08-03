import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/auth/auth_repository.dart';
import 'package:flutter_starter/login/bloc/login_bloc.dart';
import 'package:flutter_starter/login/widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  final AuthRepository _authRepository;

  LoginScreen({Key key, @required AuthRepository AuthRepository})
      : assert(AuthRepository != null),
        _authRepository = AuthRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(authRepository: _authRepository),
        child: LoginForm(authRepository: _authRepository),
      ),
    );
  }
}
