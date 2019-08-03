import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_starter/tab/tab_bloc/tab_event.dart';
import 'package:flutter_starter/tab/app_tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.todos;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
