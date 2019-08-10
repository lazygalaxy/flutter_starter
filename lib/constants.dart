const String APP_NAME = 'LazyGalaxy';
const bool isDebug = true;

//TODO: some of these should be removed
const String LOGIN = 'Login';
const String TODOS = 'Todos';

String getLoginRoute() {
  return '/' + LOGIN.toLowerCase();
}

String getTodosRoute() {
  return '/' + TODOS.toLowerCase();
}

String getTodosAddEditRoute() {
  return getTodosRoute() + "/" + "addedit";
}