import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/todo.dart';

class TodoService {
  final String _url = 'jsonplaceholder.typicode.com';

  Future<List<Todo>> getTodos() async {
    final url = Uri.https(_url, '/todos', {'userId': '1'});
    final resp = await http.get(url);

    final List<dynamic> decodedData = convert.jsonDecode(resp.body);

    return decodedData.map((e) => Todo.fromJson(e)).toList();
  }
}
