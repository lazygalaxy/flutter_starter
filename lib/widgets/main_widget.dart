import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_starter/auth/auth_repository.dart';
import 'package:flutter_starter/todos/todos_repository.dart';




import 'package:flutter_starter/widgets/home_screen.dart';
import 'package:flutter_starter/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_starter/auth/auth_bloc/auth_state.dart';
import 'package:flutter_starter/auth/auth_bloc/auth_event.dart';

import 'package:flutter_starter/todos/todo.dart';
import 'package:flutter_starter/todos/bloc/todos_bloc.dart';
import 'package:flutter_starter/todos/bloc/todos_event.dart';

import 'package:flutter_starter/login/widgets/login_screen.dart';
import 'package:flutter_starter/todos/widgets/add_edit_screen.dart';


import 'package:flutter_starter/tab/tab_bloc/tab_bloc.dart';
import 'package:flutter_starter/filtered_todos/filtered_todos_bloc/filtered_todos_bloc.dart';
import 'package:flutter_starter/stats/stats_bloc/stats_bloc.dart';


class MainWidget extends StatelessWidget {
  final AuthRepository _authRepository;
  final TodosRepository _todosRepository;

  MainWidget(this._authRepository,this._todosRepository);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          builder: (context) {
            return AuthBloc(
              authRepository: _authRepository,
            )..dispatch(CheckAuth());
          },
        ),
        BlocProvider<TodosBloc>(
          builder: (context) {
            return TodosBloc(
              todosRepository: _todosRepository,
            )..dispatch(LoadTodos());
          },
        )
      ],
      child: MaterialApp(
        title: 'Firestore Todos',
        routes: {
          '/': (context) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  final todosBloc = BlocProvider.of<TodosBloc>(context);
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabBloc>(
                        builder: (context) => TabBloc(),
                      ),
                      BlocProvider<FilteredTodosBloc>(
                        builder: (context) =>
                            FilteredTodosBloc(todosBloc: todosBloc),
                      ),
                      BlocProvider<StatsBloc>(
                        builder: (context) => StatsBloc(todosBloc: todosBloc),
                      ),
                    ],
                    child: HomeScreen(),
                  );
                }
                if (state is Unauthenticated) {
                  return LoginScreen(AuthRepository: _authRepository);
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          '/addTodo': (context) {
            final todosBloc = BlocProvider.of<TodosBloc>(context);
            return AddEditScreen(
              onSave: (task, note) {
                todosBloc.dispatch(
                  AddTodo(Todo(task, note: note)),
                );
              },
              isEditing: false,
            );
          },
        },
      ),
    );
  }
}