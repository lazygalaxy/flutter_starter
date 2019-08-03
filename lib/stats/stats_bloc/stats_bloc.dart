import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_starter/todos/bloc/todos_bloc.dart';
import 'package:flutter_starter/todos/bloc/todos_state.dart';
import 'package:flutter_starter/stats/stats_bloc/stats_event.dart';
import 'package:flutter_starter/stats/stats_bloc/stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StreamSubscription _todosSubscription;

  StatsBloc({TodosBloc todosBloc}) : assert(todosBloc != null) {
    _todosSubscription = todosBloc.state.listen((state) {
      if (state is TodosLoaded) {
        dispatch(UpdateStats(state.todos));
      }
    });
  }

  @override
  StatsState get initialState => StatsLoading();

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    if (event is UpdateStats) {
      int numActive =
          event.todos.where((todo) => !todo.complete).toList().length;
      int numCompleted =
          event.todos.where((todo) => todo.complete).toList().length;
      yield StatsLoaded(numActive, numCompleted);
    }
  }

  @override
  void dispose() {
    _todosSubscription?.cancel();
    super.dispose();
  }
}
