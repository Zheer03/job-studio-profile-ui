class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String? password;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,
  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) =>
      UserModel(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        firstName: data['first_name'],
        lastName: data['last_name'],
        email: data['email'],
        password: data['password'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
      };
}
