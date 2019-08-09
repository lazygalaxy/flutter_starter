const String APP_NAME = 'LazyGalaxy';

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