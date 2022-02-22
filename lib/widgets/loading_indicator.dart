import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../store/users_store.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, required this.store}) : super(key: key);

  final UsersStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.fetchUsersFuture.status == FutureStatus.pending
          ? const Center(child: LinearProgressIndicator())
          : Container(),
    );
  }
}
