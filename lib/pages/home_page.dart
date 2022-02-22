import 'package:flutter/material.dart';
import '../store/users_store.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsersStore store = UsersStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX User List'),
      ),
      body: Column(
        children: <Widget>[
          LoadingIndicator(store: store),
          UserListView(store: store),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.fetchUsers(),
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
