import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_starter/constants.dart';

import 'package:flutter_starter/todos/filtered/widgets/filtered_todos.dart';
import 'package:flutter_starter/todos/filtered/bloc/todos_filtered_bloc.dart';
import 'package:flutter_starter/todos/widgets/extra_actions.dart';
import 'package:flutter_starter/todos/bloc/todos_bloc.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilteredTodosBloc>(
          builder: (context) =>
              FilteredTodosBloc(todosBloc: todosBloc),
        ),
      ],
      child: _getChild(context),
    );
  }

  Widget _getChild(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME + ' - ' + TODOS),
          actions: [
            //FilterButton(),
            ExtraActions(),
          ],
        ),
        body: FilteredTodos(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, getTodosAddEditRoute());
          },
          child: Icon(Icons.add),
          tooltip: 'Add Todo',
        )
    );
  }
}
