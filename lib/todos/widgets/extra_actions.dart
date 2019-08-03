import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_starter/auth/auth_bloc/auth_event.dart';
import 'package:flutter_starter/todos/bloc/todos_bloc.dart';
import 'package:flutter_starter/todos/bloc/todos_state.dart';
import 'package:flutter_starter/todos/bloc/todos_event.dart';
import 'package:flutter_starter/todos/extra_action.dart';

class ExtraActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoaded) {
          bool allComplete = state.todos.every((todo) => todo.complete);
          return PopupMenuButton<ExtraAction>(
            onSelected: (action) {
              switch (action) {
                case ExtraAction.clearCompleted:
                  todosBloc.dispatch(ClearCompleted());
                  break;
                case ExtraAction.toggleAllComplete:
                  todosBloc.dispatch(ToggleAll());
                  break;
                case ExtraAction.signOut:
                  authBloc.dispatch(LoggedOut());
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
              PopupMenuItem<ExtraAction>(
                value: ExtraAction.toggleAllComplete,
                child: Text(
                    allComplete ? 'Mark all incomplete' : 'Mark all complete'),
              ),
              PopupMenuItem<ExtraAction>(
                value: ExtraAction.clearCompleted,
                child: Text('Clear completed'),
              ),
              PopupMenuItem<ExtraAction>(
                value: ExtraAction.signOut,
                child: Text('Sign Out'),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
