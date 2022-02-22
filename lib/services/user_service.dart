import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/user.dart';

class UserService {
  final String _url = 'jsonplaceholder.typicode.com';

  Future<List<User>> getUsers() async {
    final url = Uri.https(_url, '/users');
    final resp = await Future.delayed(
      const Duration(seconds: 2),
      () async => await http.get(url),
    );

    final List<dynamic> decodedData = convert.jsonDecode(resp.body);

    return decodedData.map((e) => User.fromJson(e)).toList();
  }
}
