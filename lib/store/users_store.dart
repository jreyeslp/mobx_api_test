import 'package:mobx/mobx.dart';
import '../services/user_service.dart';
import '../models/user.dart';

part 'users_store.g.dart';

class UsersStore = _UsersStore with _$UsersStore;

abstract class _UsersStore with Store {
  // No need to observe this as we are relying on the fetchUsersFuture.status
  List<User> users = [];
  UserService service = UserService();

  // Constructor to instantiate the Store and trigger the API fetch
  _UsersStore() {
    fetchUsers();
  }

  // Starting with an empty future to avoid null check
  @observable
  ObservableFuture<List<User>> fetchUsersFuture = emptyResponse;

  @computed
  bool get hasResults =>
      fetchUsersFuture != emptyResponse &&
      fetchUsersFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<List<User>> emptyResponse =
      ObservableFuture.value([]);

  @action
  Future<List<User>> fetchUsers() async {
    users = [];
    final future = service.getUsers();
    fetchUsersFuture = ObservableFuture(future);

    return users = await future;
  }
}
