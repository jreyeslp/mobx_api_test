import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/todos_store.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key, required this.store}) : super(key: key);

  final TodosStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Observer(
            builder: (_) {
              if (store.visibleTodos.isNotEmpty) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Theme.of(context).dividerColor),
                        ),
                      ),
                      child: SwitchListTile(
                        title: const Text(
                          'Completed todos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: store.completed,
                        onChanged: (value) => store.completed = value,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: store.visibleTodos.length,
                        itemBuilder: (_, int index) {
                          final todo = store.visibleTodos[index];
                          return ListTile(
                            leading: todo.completed
                                ? const Icon(Icons.check_box_outlined)
                                : const Icon(
                                    Icons.check_box_outline_blank_outlined),
                            title: Text(todo.title),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('We could not find any todos'),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
