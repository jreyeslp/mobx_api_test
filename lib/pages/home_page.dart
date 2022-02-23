import 'package:flutter/material.dart';
import '../store/todos_store.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TodosStore store = TodosStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Todos List'),
      ),
      body: TodoListView(store: store),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.fetchTodos(),
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
