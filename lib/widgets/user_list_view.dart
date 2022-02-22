import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/users_store.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key? key, required this.store}) : super(key: key);

  final UsersStore store;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return Container();
          }

          if (store.users.isEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('We could not find any users'),
              ],
            );
          }

          return ListView.builder(
            itemCount: store.users.length,
            itemBuilder: (_, int index) {
              final user = store.users[index];
              return ListTile(
                leading: const Icon(Icons.person, size: 30),
                title: Text(user.name),
                subtitle: Text(user.username),
              );
            },
          );
        },
      ),
    );
  }
}
