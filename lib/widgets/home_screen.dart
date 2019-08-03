import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_starter/tab/tab_bloc/tab_bloc.dart';
import 'package:flutter_starter/tab/tab_bloc/tab_event.dart';
import 'package:flutter_starter/tab/app_tab.dart';
import 'package:flutter_starter/tab/widgets/tab_selector.dart';

import 'package:flutter_starter/filtered_todos/widgets/filter_button.dart';
import 'package:flutter_starter/filtered_todos/widgets/filtered_todos.dart';

import 'package:flutter_starter/todos/widgets/extra_actions.dart';
import 'package:flutter_starter/stats/widgets/stats.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Firestore Todos'),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),
              ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addTodo');
            },
            child: Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
