import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_starter/simple_bloc_delegate.dart';
import 'package:flutter_starter/widgets/main_widget.dart';
import 'package:flutter_starter/auth/auth_repository_firebase.dart';
import 'package:flutter_starter/todos/todos_repository_firebase.dart';

void main() async {
  // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MainWidget(AuthRepositoryFirebase(), TodosRepositoryFirebase()));
}