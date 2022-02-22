class User {
  User({
    required this.id,
    required this.name,
    required this.username,
  });

  int id;
  String name;
  String username;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name'], username: json['username']);
}
