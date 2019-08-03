import 'package:flutter/material.dart';
import 'package:flutter_starter/auth/auth_repository.dart';
import 'package:flutter_starter/register/widgets/register_screen.dart';

class CreateAccountButton extends StatelessWidget {
  final AuthRepository _authRepository;

  CreateAccountButton({Key key, @required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(authRepository: _authRepository);
          }),
        );
      },
    );
  }
}
