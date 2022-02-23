import 'package:mobx/mobx.dart';
import '../services/todo_service.dart';
import '../models/todo.dart';

part 'todos_store.g.dart';

class TodosStore = _TodosStore with _$TodosStore;

abstract class _TodosStore with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  TodoService service = TodoService();

  @observable
  bool completed = false;

  @observable
  ObservableFuture<List<Todo>> fetchTodosFuture = emptyResponse;

  @computed
  bool get hasResults =>
      fetchTodosFuture != emptyResponse &&
      fetchTodosFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Todo>> emptyResponse =
      ObservableFuture.value([]);

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((element) => element.completed == true));

  @computed
  ObservableList<Todo> get visibleTodos {
    return completed ? completedTodos : todos;
  }

  // Constructor to instantiate the Store and trigger the API fetch
  _TodosStore() {
    fetchTodos();
  }

  @action
  Future<List<Todo>> fetchTodos() async {
    print('Fetching todos...');
    todos.clear();
    final future = service.getTodos();
    fetchTodosFuture = ObservableFuture(future);
    // return todos = ObservableList.of(await service.getTodos());

    return todos = ObservableList.of(await future);
  }
}
