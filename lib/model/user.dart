class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
    required this.token,
    required this.address,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String password;
  late final String type;
  late final String token;
  late final String address;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    type = json['type'] ?? "";
    token = json['token'] ?? "";
    address = json['address'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['type'] = type;
    _data['token'] = token;
    _data['address'] = address;
    return _data;
  }
}
