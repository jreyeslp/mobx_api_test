import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../store/todos_store.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.store}) : super(key: key);

  final TodosStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.fetchTodosFuture.status == FutureStatus.pending
          ? const Center(child: LinearProgressIndicator())
          : Container(),
    );
  }
}
