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
    todos.clear();
    return todos = ObservableList.of(await service.getTodos());
  }
}
