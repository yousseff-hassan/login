class LoginModel {
  final String email;
  final String password;
  final String? token;
  final String? name;

  LoginModel({
    required this.email,
    required this.password,
    this.token,
    this.name,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      token: json['token'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'token': token,
      'name': name,
    };
  }
}
