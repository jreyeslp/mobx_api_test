// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersStore on _UsersStore, Store {
  Computed<bool>? _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults,
              name: '_UsersStore.hasResults'))
          .value;

  final _$fetchUsersFutureAtom = Atom(name: '_UsersStore.fetchUsersFuture');

  @override
  ObservableFuture<List<User>> get fetchUsersFuture {
    _$fetchUsersFutureAtom.reportRead();
    return super.fetchUsersFuture;
  }

  @override
  set fetchUsersFuture(ObservableFuture<List<User>> value) {
    _$fetchUsersFutureAtom.reportWrite(value, super.fetchUsersFuture, () {
      super.fetchUsersFuture = value;
    });
  }

  final _$fetchUsersAsyncAction = AsyncAction('_UsersStore.fetchUsers');

  @override
  Future<List<User>> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  @override
  String toString() {
    return '''
fetchUsersFuture: ${fetchUsersFuture},
hasResults: ${hasResults}
    ''';
  }
}
